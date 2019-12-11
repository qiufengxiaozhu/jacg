package com.zte.zudp.admin.common.upload.util;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointRest;
import com.zte.zudp.admin.common.enums.AuthorizedType;
import com.zte.zudp.admin.common.exception.ZudpFileUploadException;
import com.zte.zudp.admin.common.util.FileUtil;
import com.zte.zudp.admin.common.util.StringUtil;
import com.zte.zudp.admin.modules.sys.SystemMenu;
import java.io.IOException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
/**
 * @Description 公共上传类，不用登录也能附件上传
 * @Author UploadControllerOfGuest
 * @Date 2019/12/10 14:38
 **/
@Controller
@RequestMapping({"/uploadOfGuest"})
@EndpointModule(
        id = "uploadOfGuest",
        name = "游客上传",
        order = 124,
        parent = SystemMenu.class
)
public class UploadControllerOfGuest {
    public UploadControllerOfGuest() {
    }

    @JSON
    @PostMapping({"/custom"})
    @EndpointRest(
            id = "customUploadOfGuest",
            name = "自定义游客上传",
            authorizedType = AuthorizedType.GUEST
    )
    public String getCustomTypeResource(MultipartFile file, String acceptType, String modelName) throws IOException, ZudpFileUploadException {
        if (StringUtil.isEmpty(acceptType)) {
            return FileUtil.uploadAll(file, modelName);
        } else {
            acceptType = acceptType.replaceAll(",", ",.");
            acceptType = "." + acceptType;
            return FileUtil.uploadCustomTypeFile(file, acceptType, modelName);
        }
    }
}
