/*
 *njust.biz.MessageBiz.java
 * 2007-08-10
 * ����Ϣҵ����
 */
package njust.biz;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import njust.dao.MessageDao;
import njust.entity.Message;

public class MessageBiz {
    private MessageDao messageDao = new MessageDao(); // ��ö���Ϣ�����ݷ��ʶ���
    
    //��������
    public int save(Message message){
        return messageDao.save(message);
    }
    
     //ɾ������
    public int delete(int id){
        return messageDao.delete(id);
    }

    //��ѯ����
    public List listByReceiveUname(String uname){
        return messageDao.listByReceiveUname(uname);
    }
    
     //���ݶ���Ϣid��һ������Ϣ
    public Message findMessage(int id){
        Message message=new Message();
        message = messageDao.findMessage(id);
        int sign = message.getReadSign();
        message.setReadSign(sign);
        if(sign==0){
            messageDao.update(message);
        }
        return message;
    }
}
