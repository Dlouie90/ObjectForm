package formgenerator.model.dao;

import formgenerator.model.AnswerSheet;

public interface AnswerSheetDAO {

	AnswerSheet getAnswerSheet(Integer id);
	AnswerSheet saveAnswerSheet(AnswerSheet answersheet);
	void deleteSheet(AnswerSheet answersheet);
}
