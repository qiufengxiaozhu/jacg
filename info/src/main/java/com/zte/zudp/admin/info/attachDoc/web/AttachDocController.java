package com.zte.zudp.admin.info.attachDoc.web;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
* @ClassName: AttachDocController 
* @Description: 附件上传公用类
* @date 2019-01-04
 */
@Controller
@RequestMapping("${sys.url.admin}/m/file")
public class AttachDocController  {

//	@RequestMapping(value = "/upload", method = RequestMethod.POST)
//	@ResponseBody
//	public String handleFileUpload(String inputId, MultipartHttpServletRequest request){
//        try {
//
//            MultipartFile realPicFile = request.getFile(inputId);
//            String newFilePath = FileUtilNew.saveUploadFile(realPicFile,inputId);
//
//            return  "{\"path\" : \"" + newFilePath +  "\"}";
//        } catch (Exception e) {
//        	e.printStackTrace();
//            return "file not exist";
//        }
//    }
}
