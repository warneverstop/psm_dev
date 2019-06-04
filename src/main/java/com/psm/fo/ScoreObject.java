package com.psm.fo;

import com.psm.dto.ScoreInfo;

import java.io.Serializable;
import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/29 19:50
 **/
public class ScoreObject implements Serializable {
   private List<ScoreInfo> scoreInfoList;

    public List<ScoreInfo> getScoreInfoList() {
        return scoreInfoList;
    }

    public void setScoreInfoList(List<ScoreInfo> scoreInfoList) {
        this.scoreInfoList = scoreInfoList;
    }
}
