package formgenerator.web.controller;

import java.util.ArrayList;
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
import formgenerator.model.FormElement;
import formgenerator.model.MultipleChoice;
import formgenerator.model.Page;
import formgenerator.model.Textbox;
import formgenerator.model.dao.ElementDAO;
import formgenerator.model.dao.FormDAO;
import formgenerator.model.dao.PageDAO;

@Controller
@SessionAttributes({"textbox","multiplechoice"})
public class ElementController {
	
	@Autowired
	private ElementDAO elementDao;
	@Autowired
	private FormDAO formDao;
	@Autowired
	private PageDAO pageDao;
	
	@RequestMapping(value="element/list.html",method = RequestMethod.GET)
	private String list(@RequestParam Integer formId,@RequestParam Integer pageId, ModelMap model)
	{
		List<FormElement> elements = elementDao.getElements(pageId);
		
		model.put("elements", elements);
		model.addAttribute("pageId", pageId);
		model.addAttribute("formId", formId);
		model.addAttribute("menu", "<a style='color: white' href='../member/list.html'>Users</a>&nbsp;&nbsp;<a style='color: white' href='../form/list.html'>Forms</a>&nbsp;\\&nbsp;<a style='color: white' href='../page/list.html?formId="+formId+"'>Pages</a>&nbsp;\\&nbsp;<a style='color: white' href='list.html?formId="+formId+"&pageId="+pageId+"'>Elements</a>");
		
		return "element/list";
		
	}
	
	@RequestMapping(value="element/list.html",method = RequestMethod.POST)
	private String list(@RequestParam Integer elementType,@RequestParam Integer pageId,@RequestParam Integer formId)
	{
		
		if (elementType==0)
			return "redirect:addTextbox.html?pageId="+pageId+"&formId="+formId;
		else
			return "redirect:addCheckbox.html?pageId="+pageId+"&formId="+formId;
		
	}
	/*
	@RequestMapping(value="element/addTextbox.html",method = RequestMethod.POST)
	private String addTextbox( @ModelAttribute Textbox textbox, SessionStatus status, BindingResult result)
	{
		
		//FormElement element = elementDao.saveElement(textbox);
		
		//status.setComplete();
		
		return "redirect:list.html";	
	}
	*/
	
	@RequestMapping(value="/element/addTextbox.html",method = RequestMethod.GET)
	private String addTextbox(@RequestParam Integer pageId, @RequestParam Integer formId,ModelMap model)
	{
		Textbox textboxElement = new Textbox();
		
		Page page = pageDao.getPage(pageId);
		List<Page> pages= new ArrayList<Page>();
		pages.add(page);
		textboxElement.setForm(formDao.getForm(formId));
		textboxElement.setPages(pages);
		
		model.put("textbox", textboxElement);
		model.addAttribute("pageId", pageId);
		model.addAttribute("formId", formId);
		model.addAttribute("menu", "<a style='color: white' href='../member/list.html'>Users</a>&nbsp;&nbsp;<a style='color: white' href='../form/list.html'>Forms</a>&nbsp;\\&nbsp;<a style='color: white' href='../page/list.html?formId="+formId+"'>Pages</a>&nbsp;\\&nbsp;<a style='color: white' href='list.html?formId="+formId+"&pageId="+pageId+"'>Elements</a>");
		
		return "element/addTextbox";
	}
	
	@RequestMapping(value="/element/addTextbox.html",method = RequestMethod.POST)
	private String addTextbox( @ModelAttribute Textbox textbox,@RequestParam Integer pageId, @RequestParam Integer formId, SessionStatus status)
	{
		FormElement savedElement = elementDao.saveElement(textbox);
		
		Page changedPage = pageDao.getPage(pageId);
		List<FormElement> elements=changedPage.getElements();
		elements.add(savedElement);
		changedPage = pageDao.savePage(changedPage);
		
		status.setComplete();
		
		return "redirect:list.html?formId="+formId+"&pageId="+pageId;	
	}


	@RequestMapping(value="/element/editTextbox.html",method = RequestMethod.GET)
	private String editTextbox(@RequestParam Integer elementId,@RequestParam Integer pageId,@RequestParam Integer formId, ModelMap model)
	{
		
		Textbox curElement = (Textbox)elementDao.getElement(elementId);
		
		model.put("textbox", curElement);
		model.addAttribute("pageId", pageId);
		model.addAttribute("formId", formId);
		model.addAttribute("menu", "<a style='color: white' href='../member/list.html'>Users</a>&nbsp;&nbsp;<a style='color: white' href='../form/list.html'>Forms</a>&nbsp;\\&nbsp;<a style='color: white' href='../page/list.html?formId="+formId+"'>Pages</a>&nbsp;\\&nbsp;<a style='color: white' href='list.html?formId="+formId+"&pageId="+pageId+"'>Elements</a>");
		
		return "element/editTextbox";
	}
	
	@RequestMapping(value="/element/editTextbox.html",method = RequestMethod.POST)
	private String editTextbox( @ModelAttribute Textbox textbox,@RequestParam Integer pageId, @RequestParam Integer formId, SessionStatus status)
	{
		textbox = (Textbox)elementDao.saveElement(textbox);
		status.setComplete();
		return "redirect:list.html?formId="+formId+"&pageId="+pageId;	
	}
	
	
	@RequestMapping(value="/element/delete.html",method = RequestMethod.GET)
	private String delete(@RequestParam Integer elementId,@RequestParam Integer pageId, @RequestParam Integer formId)
	{
		FormElement curElement = (Textbox)elementDao.getElement(elementId);

		
		for(Page p : curElement.getPages())
		{
			p.getElements().remove(curElement);
		}
		
		
		//FormElement changedElement = elementDao.saveElement(curElement);
		
		Boolean result = elementDao.delete(curElement);
		
		
		return "redirect:list.html?formId="+formId+"&pageId="+pageId;
	}

	@RequestMapping(value="/element/addCheckbox.html",method = RequestMethod.GET)
	private String addCheckbox(@RequestParam Integer pageId, @RequestParam Integer formId,ModelMap model)
	{

	
		MultipleChoice checkboxElement;
		
		checkboxElement = new MultipleChoice();
		
		checkboxElement.setIsMultipleAnswerAllowed(true);
		
		List<Choice> choices = new ArrayList<Choice>();
		choices.add(new Choice());
		checkboxElement.setChoices(choices);
		Page page = pageDao.getPage(pageId);
		List<Page> pages= new ArrayList<Page>();
		pages.add(page);
		checkboxElement.setForm(formDao.getForm(formId));
		checkboxElement.setPages(pages);

		
		model.put("checkbox", checkboxElement);
		model.addAttribute("pageId", pageId);
		model.addAttribute("formId", formId);
		model.addAttribute("menu", "<a style='color: white' href='../member/list.html'>Users</a>&nbsp;&nbsp;<a style='color: white' href='../form/list.html'>Forms</a>&nbsp;\\&nbsp;<a style='color: white' href='../page/list.html?formId="+formId+"'>Pages</a>&nbsp;\\&nbsp;<a style='color: white' href='list.html?formId="+formId+"&pageId="+pageId+"'>Elements</a>");
		
		return "element/addCheckbox";
	}
	
	@RequestMapping(value="/element/addCheckbox.html",method = RequestMethod.POST)
	private String addCheckbox( @ModelAttribute MultipleChoice checkbox,@RequestParam Integer pageId, @RequestParam Integer formId, SessionStatus status)
	{

		FormElement savedElement = elementDao.saveElement(checkbox);
		
		Page changedPage = pageDao.getPage(pageId);
		List<FormElement> elements=changedPage.getElements();
		elements.add(savedElement);
		changedPage = pageDao.savePage(changedPage);
		
		status.setComplete();
		
		return "redirect:list.html?formId="+formId+"&pageId="+pageId;
	
	}
	
	@RequestMapping(value="/element/editCheckbox.html",method = RequestMethod.GET)
	private String editCheckbox(@RequestParam Integer pageId, @RequestParam Integer formId, @RequestParam Integer elementId,ModelMap model)
	{

		MultipleChoice multiplechoice = (MultipleChoice)elementDao.getElement(elementId);
		
		model.put("multiplechoice", multiplechoice);
		model.addAttribute("pageId", pageId);
		model.addAttribute("formId", formId);
		model.addAttribute("elementId", elementId);
		model.addAttribute("menu", "<a style='color: white' href='../member/list.html'>Users</a>&nbsp;&nbsp;<a style='color: white' href='../form/list.html'>Forms</a>&nbsp;\\&nbsp;<a style='color: white' href='../page/list.html?formId="+formId+"'>Pages</a>&nbsp;\\&nbsp;<a style='color: white' href='list.html?formId="+formId+"&pageId="+pageId+"'>Elements</a>");
		
		return "element/editCheckbox";
	}
	
	@RequestMapping(value="/element/editCheckbox.html",method = RequestMethod.POST)
	private String editCheckbox( @ModelAttribute("multiplechoice") MultipleChoice multiplechoice,@RequestParam Integer pageId, @RequestParam Integer formId, @RequestParam Integer elementId, SessionStatus status)
	{

		multiplechoice = (MultipleChoice)elementDao.saveElement(multiplechoice);
		
		status.setComplete();
		
		return "redirect:list.html?formId="+formId+"&pageId="+pageId;
	
	}
}
