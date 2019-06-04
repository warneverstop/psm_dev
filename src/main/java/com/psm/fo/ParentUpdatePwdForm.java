package com.psm.fo;

/**
 * @author: su
 * @creat: 2019/6/3 10:02
 **/
public class ParentUpdatePwdForm {
    private Integer parentId;
    private String oldPwd;
    private String newPwd;
    private String newPwdToo;

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getOldPwd() {
        return oldPwd;
    }

    public void setOldPwd(String oldPwd) {
        this.oldPwd = oldPwd;
    }

    public String getNewPwd() {
        return newPwd;
    }

    public void setNewPwd(String newPwd) {
        this.newPwd = newPwd;
    }

    public String getNewPwdToo() {
        return newPwdToo;
    }

    public void setNewPwdToo(String newPwdToo) {
        this.newPwdToo = newPwdToo;
    }
}
