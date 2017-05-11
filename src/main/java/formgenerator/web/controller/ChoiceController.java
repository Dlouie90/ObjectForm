package formgenerator.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import formgenerator.model.Choice;
import formgenerator.model.MultipleChoice;
import formgenerator.model.dao.ChoiceDAO;
import formgenerator.model.dao.ElementDAO;

@Controller
@SessionAttributes("choice")
public class ChoiceController {

	@Autowired
	private ChoiceDAO choiceDao;
	@Autowired
	private ElementDAO elementDao;
	
	@RequestMapping(value="choice/list.html",method = RequestMethod.GET)
	private String list(@RequestParam Integer elementId,@RequestParam Integer formId,@RequestParam Integer pageId, ModelMap model)
	{
		List<Choice> choices = choiceDao.getChoices(elementId);
		
		model.put("choices", choices);
		model.addAttribute("pageId", pageId);
		model.addAttribute("formId", formId);
		model.addAttribute("elementId", elementId);
		
		return "choice/list";
		
	}
	
	@RequestMapping(value="/choice/add.html",method = RequestMethod.GET)
	private String addTextbox(@RequestParam Integer pageId, @RequestParam Integer formId, @RequestParam Integer elementId,ModelMap model)
	{
		Choice choice = new Choice();
		
		model.put("choice", choice);
		model.addAttribute("pageId", pageId);
		model.addAttribute("formId", formId);
		model.addAttribute("elementId", elementId);
		model.addAttribute("menu", "<a style='color: white' href='../member/list.html'>Users</a>&nbsp;&nbsp;<a style='color: white' href='../form/list.html'>Forms</a>&nbsp;\\&nbsp;<a style='color: white' href='../page/list.html?formId="+formId+"'>Pages</a>&nbsp;\\&nbsp;<a style='color: white' href='../element/list.html?formId="+formId+"&pageId="+pageId+"&elementId="+elementId+"'>Elements</a>&nbsp;\\&nbsp;<a style='color: white' href='list.html?formId="+formId+"&pageId="+pageId+"&elementId="+elementId+"'>Choices</a>");
		
		return "choice/add";
	}
	
	@RequestMapping(value="/choice/add.html",method = RequestMethod.POST)
	private String addTextbox( @ModelAttribute Choice choice,@RequestParam Integer pageId, @RequestParam Integer formId, @RequestParam Integer elementId, SessionStatus status)
	{
		Choice savedChoice = choiceDao.saveChoice(choice);
		MultipleChoice changedElement = (MultipleChoice)elementDao.getElement(elementId);
		changedElement.getChoices().add(savedChoice);
		changedElement = (MultipleChoice)elementDao.saveElement(changedElement);
		
		status.setComplete();
		
		return "redirect:list.html?formId="+formId+"&pageId="+pageId+"&elementId="+elementId;	
	}
	
	@RequestMapping(value="/choice/edit.html",method = RequestMethod.GET)
	private String editTextbox(@RequestParam Integer elementId,@RequestParam Integer pageId, @RequestParam Integer formId, @RequestParam Integer choiceId, ModelMap model)
	{
		
		Choice choice = choiceDao.getChoice(choiceId);
		
		model.put("choice", choice);
		model.addAttribute("pageId", pageId);
		model.addAttribute("formId", formId);
		model.addAttribute("elementId", elementId);
		model.addAttribute("menu", "<a style='color: white' href='../member/list.html'>Users</a>&nbsp;&nbsp;<a style='color: white' href='../form/list.html'>Forms</a>&nbsp;\\&nbsp;<a style='color: white' href='../page/list.html?formId="+formId+"'>Pages</a>&nbsp;\\&nbsp;<a style='color: white' href='../element/list.html?formId="+formId+"&pageId="+pageId+"&elementId="+elementId+"'>Elements</a>&nbsp;\\&nbsp;<a style='color: white' href='list.html?formId="+formId+"&pageId="+pageId+"&elementId="+elementId+"'>Choices</a>");
		
		return "choice/add";
	}
	
	@RequestMapping(value="/choice/edit.html",method = RequestMethod.POST)
	private String editTextbox( @ModelAttribute Choice choice, @RequestParam Integer elementId, @RequestParam Integer pageId, @RequestParam Integer formId, SessionStatus status)
	{
		choiceDao.saveChoice(choice);		
		return "redirect:list.html?formId="+formId+"&pageId="+pageId+"&elementId="+elementId;	
	}
	
	@RequestMapping(value="/choice/delete.html",method = RequestMethod.GET)
	private String delete(@RequestParam Integer elementId,@RequestParam Integer pageId, @RequestParam Integer formId, @RequestParam Integer choiceId)
	{
		Choice choice = choiceDao.getChoice(choiceId);
		
		MultipleChoice changedElement = (MultipleChoice)elementDao.getElement(elementId);
		changedElement.getChoices().remove(choice);
		changedElement = (MultipleChoice)elementDao.saveElement(changedElement);
		
		Boolean result = choiceDao.delete(choice);
		
		
		return "redirect:list.html?formId="+formId+"&pageId="+pageId+"&elementId="+elementId;
	}
}
