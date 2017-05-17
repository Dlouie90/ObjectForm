package formgenerator.model.dao;

import java.util.List;

import formgenerator.model.Answer;

public interface AnswerDAO {
	Answer getAnswer(Integer id);
	Answer saveAnswer(Answer answer);
	boolean delete(Answer answer);
	List<Answer> getAnswers(Integer elementId);
	List<Answer> getAnswers(Integer elementId,Integer memberId);
	List<Answer> getMemberAnswers(Integer formId, Integer memberId);
	List<Answer> getMemberAnswers(Integer formId, Integer memberId, Integer elementId);
	List<Answer> getAnswersBySheet(Integer memberId, Integer answersheetId);
}