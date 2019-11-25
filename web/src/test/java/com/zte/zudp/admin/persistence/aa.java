package com.zte.zudp.admin.persistence;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;


/**
 * @author piumnl
 * @version 1.0.0
 * @since on 2018-01-19.
 */
public class aa {

    public static void main(String[] args) throws IOException {
        File file = new File("D:\\test") ;    // 定义要压缩的文件夹
        File zipFile = new File("D:\\test.zip") ;  // 定义压缩文件名称
        InputStream input = null ;  // 定义文件输入流
        ZipOutputStream zipOut; // 声明压缩流对象
        zipOut = new ZipOutputStream(new FileOutputStream(zipFile)) ;
        zipOut.setComment("liuxunTEST") ;   // 设置注释
        int temp = 0;
        zip("", file, zipOut);
        zipOut.close() ;    // 关闭输出流
    }

    private static void zip(String parentname, File file, ZipOutputStream zipOut) throws IOException {
        int temp = 0;
        FileInputStream input;
        if(file.isDirectory()){ // 判断是否是文件夹
            File lists[] = file.listFiles() ;   // 列出全部文件
            for(int i=0;i<lists.length;i++){
                if (lists[i].isDirectory()) {
                    zip(filename(parentname, lists[i].getName()),lists[i], zipOut);
                } else {
                    input = new FileInputStream(lists[i]) ; // 定义文件的输入流
                    zipOut.putNextEntry(new ZipEntry(parentname+File.separator+lists[i].getName())) ;  // 设置 ZipEntry 对象
                    while((temp=input.read())!=-1){ // 读取内容
                        zipOut.write(temp) ;    // 压缩输出
                    }
                    zipOut.closeEntry();
                    input.close() ; // 关闭输入流
                }
            }
        } else {
            input = new FileInputStream(file) ; // 定义文件的输入流
            zipOut.putNextEntry(new ZipEntry(filename(parentname, file.getName())
                    +File.separator+file.getName())) ;  // 设置 ZipEntry 对象
            while((temp=input.read())!=-1){ // 读取内容
                zipOut.write(temp) ;    // 压缩输出
            }
            input.close() ; // 关闭输入流
        }
    }

    private static String filename(String parent, String cur) {
        if (parent == null || "".equals(parent)) {
            return cur;
        } else {
            return parent + "/" + cur;
        }
    }
}
