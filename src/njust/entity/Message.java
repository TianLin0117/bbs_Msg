/*
 * njust.entity.Message
 * 2007-08-13
 * ����Ϣ��
 */
package njust.entity;

import java.util.Date;

public class Message {
    private int id;              // ��Ϣid
    private String note;          // ��Ϣ����
    private String sendUname;     // �����ߵ�id
    private String receiveUname;  // �����ߵ�id
    private Date postTime;      // ����ʱ��
    private int    readSign;      // �Ѷ���ǣ�1��ʾ�Ѷ���0��ʾδ��
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    
    public String getNote() {
        return note;
    }
    public void setNote(String note) {
        this.note = note;
    }
    
    public String getReceiveUname() {
        return receiveUname;
    }
    public void setReceiveUname(String receiveUname) {
        this.receiveUname = receiveUname;
    }
    
    public String getSendUname() {
        return sendUname;
    }
    public void setSendUname(String sendUname) {
        this.sendUname = sendUname;
    }
    
    public Date getPostTime() {
        return postTime;
    }
    public void setPostTime(Date postTime) {
        this.postTime = postTime;
    }
    
    public int getReadSign() {
        return readSign;
    }
    public void setReadSign(int readSign) {
        this.readSign = readSign;
    }
}
