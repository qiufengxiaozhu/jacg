package com.zte.zudp.admin.info.report.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;

/**
 * 多媒体资源实体类
 */
public class MultimediaResources extends DataEntity {

    /**
     * 图片资源路径
     */
    private String image;

    /**
     * 视频资源路径
     */
    private String video;

    /**
     * 语音资源路径
     */
    private String sound;

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public String getSound() {
        return sound;
    }

    public void setSound(String sound) {
        this.sound = sound;
    }
}
