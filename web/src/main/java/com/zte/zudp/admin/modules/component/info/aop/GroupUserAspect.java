package com.zte.zudp.admin.modules.component.info.aop;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.zte.zudp.admin.modules.sys.user.entity.User;
import com.zte.zudp.admin.modules.sys.user.service.UserService;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zte.zudp.admin.common.security.SubjectUtil;
import com.zte.zudp.admin.common.util.AopUtil;
import com.zte.zudp.admin.common.util.IDUtil;
import com.zte.zudp.admin.common.util.StringUtil;
import com.zte.zudp.admin.modules.component.info.entity.InfoReceiver;
import com.zte.zudp.admin.modules.component.info.entity.InfoSender;
import com.zte.zudp.admin.modules.component.info.service.InfoSenderService;
import com.zte.zudp.admin.modules.sys.group.entity.Group;
import com.zte.zudp.admin.modules.sys.group.service.GroupService;

/**
 * @author zzw
 * @version 1.0.0
 * @since on 2018/3/15.
 */
@Aspect
@Component
public class GroupUserAspect {

    @Autowired
    private InfoSenderService infoSenderService;
    @Autowired
    private UserService userService;
    @Autowired
    private GroupService groupService;

    private static Logger logger = LoggerFactory.getLogger(GroupUserAspect.class);

    @Pointcut("execution(public * com.zte.zudp.admin.modules.sys.user.service.UserService.batchUpdateGroup(..))")
    public void batchUpdateGroup() {
    }

    @Pointcut("execution(public * com.zte.zudp.admin.modules.sys.user.service.UserService.revokeGroup(..))")
    public void revokeGroup() {
    }

    /**
     * 对service batchUpdateGroup的横切 只要调用了该方法就代表移除或者移入组织 所以发送消息给相应的人
     *
     * @param pjp
     * @return
     * @throws Throwable
     */
    @Around("batchUpdateGroup()")
    public Object batchUpdateGroupArround(ProceedingJoinPoint pjp) throws Throwable {
        Map<String, Object> fileds = AopUtil.getMethodFiled(pjp);
        String groupId = (String) fileds.get("id");
        String[] userIds = (String[]) fileds.get("ids");
        String selectOrUpdate = (String) fileds.get("insertOrDelete");
        Group group = groupService.get(groupId);
        //构建发送者
        InfoSender infoSender = new InfoSender();
        List<InfoReceiver> infoReceivers = new ArrayList<>();
        if (group != null) {
            String infoSenderId = String.valueOf(IDUtil.simpleId());
            infoSender.setId(infoSenderId);
            infoSender.setType(1);
            infoSender.setLevel(1);
            infoSender.setSender(new User(SubjectUtil.getSubject().getId()));
            infoSender.setCreateDate(new Date());
            if (StringUtil.isNotEmpty(selectOrUpdate) && "true".equals(selectOrUpdate)) {
                infoSender.setMessage("您好,您被移出了组织:" + group.getName());
            } else {
                infoSender.setMessage("您好,您被移入了组织:" + group.getName());
            }
            //构建接收人
            List<User> list = new ArrayList<>();
            for (String id : userIds) {
                list.add(userService.get(id));
            }
            list.forEach(user -> {
                InfoReceiver infoReceiver = new InfoReceiver();
                infoReceiver.setId(String.valueOf(IDUtil.simpleId()));
                infoReceiver.setStatus(1);
                infoReceiver.setInfoSender(infoSender);
                infoReceiver.setReceiver(user);
                infoReceivers.add(infoReceiver);
            });
        }
        Object object = pjp.proceed();
        if (group != null) {
            if (infoReceivers != null && infoReceivers.size() != 0) {
                infoSenderService.sendMessage(infoSender, infoReceivers);
            }
        } else {
            logger.debug("该组织已经被删除,不发送消息");
        }
        return object;
    }


    /**
     * 同上只要调用了该方法就 移出组织
     *
     * @param pjp
     * @return
     * @throws Throwable
     */
    @Around("revokeGroup()")
    public Object revokeGroupArround(ProceedingJoinPoint pjp) throws Throwable {
        Group group = null;
        List<InfoReceiver> infoReceivers = new ArrayList<>();
        InfoSender infoSender = new InfoSender();
        Map<String, Object> fileds = AopUtil.getMethodFiled(pjp);
        //组织的id
        String id = (String) fileds.get("id");
        group = groupService.get(id);
        if (group != null) {
            String infoSenderId = String.valueOf(IDUtil.simpleId());
            infoSender.setId(infoSenderId);
            infoSender.setType(1);
            infoSender.setLevel(1);
            infoSender.setSender(new User(SubjectUtil.getSubject().getId()));
            infoSender.setCreateDate(new Date());
            infoSender.setMessage("您好,您被移出了组织" + group.getName());
            //存在于该组织的用户
            group.setSelectGroup("true");
            List<User> list = userService.getByGroup(group);
            list.forEach(user -> {
                InfoReceiver infoReceiver = new InfoReceiver();
                infoReceiver.setId(String.valueOf(IDUtil.simpleId()));
                infoReceiver.setStatus(1);
                infoReceiver.setInfoSender(infoSender);
                infoReceiver.setReceiver(user);
                infoReceivers.add(infoReceiver);
            });
        }
        Object object = pjp.proceed();
        if (group != null) {
            if (infoReceivers != null && infoReceivers.size() != 0) {
                infoSenderService.sendMessage(infoSender, infoReceivers);
            }
        } else {
            logger.debug("该组织已经被删除,不发送消息");
        }
        return object;
    }

}
