package model.bo;

import java.util.ArrayList;

import model.bean.Message;
import model.dao.MessageDAO;

public class MessageBO {
	MessageDAO messageDAO = new MessageDAO();
	public ArrayList<Message> getListMessage(){
		return messageDAO.getListMessage();
	}
	public ArrayList<Message> getListMessageByUser(int idUser){
		return messageDAO.getListMessageByUser(idUser);
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
	public int countUnseenMessage() {
		return messageDAO.countUnseenMessage();
	}
	public boolean setSeen(int idMessage) {
		return messageDAO.setSeen(idMessage);
	}
}
