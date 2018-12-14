package model.bo;

import java.util.ArrayList;

import model.bean.Message;
import model.dao.MessageDAO;

public class MessageBO {
	MessageDAO messageDAO = new MessageDAO();
	public ArrayList<Message> getListMessage(){
		return messageDAO.getListMessage();
	}
	public Message getMessage(int idMessage) {
		return messageDAO.getMessage(idMessage);
	}
	public boolean addMessage(Message message) {
		return messageDAO.addMessage(message);
	}
	public boolean replyMessage(int idMessage, String messageReply ) {
		return messageDAO.reply(idMessage, messageReply);
	}
}
