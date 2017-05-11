package formgenerator.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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
import formgenerator.model.FormFile;
import formgenerator.model.MultipleChoice;
import formgenerator.model.Page;
import formgenerator.model.Textbox;
import formgenerator.model.dao.ChoiceDAO;
import formgenerator.model.dao.ElementDAO;
import formgenerator.model.dao.FormDAO;
import formgenerator.model.dao.ObjectFormDAOI;
import formgenerator.model.dao.PageDAO;

@Controller
@SessionAttributes({"textbox", "multiplechoice", "formFile"})
public class ElementController {
	
	@Autowired
	private ChoiceDAO choiceDao;
	
	@Autowired
	private ElementDAO elementDao;
	
	@Autowired
	private FormDAO formDao;
	
	@Autowired
	private PageDAO pageDao;
	
	private final ObjectFormDAOI<FormFile> formfileDao;
	
	@Autowired
	public ElementController(@Qualifier("FormFileUpload") final ObjectFormDAOI<FormFile> dao){
		this.formfileDao = dao;		
	}
	
	@RequestMapping(value="element/list.html",method = RequestMethod.GET)
	private String list(@RequestParam Integer formId,@RequestParam Integer pageId, ModelMap model){
		
		List<FormElement> elements = elementDao.getElements(pageId);
		
		model.put("elements", elements);
		model.addAttribute("pageId", pageId);
		model.addAttribute("formId", formId);
		
		return "element/list";
		
	}
	
	@RequestMapping(value="element/list.html",method = RequestMethod.POST)
	private String list(@RequestParam Integer elementType,@RequestParam Integer pageId,@RequestParam Integer formId){
		
		if (elementType==0){
			return "redirect:addTextbox.html?pageId="+pageId+"&formId="+formId;
		}			
		else if(elementType==1){
			return "redirect:addCheckbox.html?pageId="+pageId+"&formId="+formId;
		}else{
			return "redirect:addFileUpload.html?pageId="+pageId+"&formId="+formId;
		}	
	}
	
	@RequestMapping(value="element/addFileUpload.html",method = RequestMethod.GET)
	private String addFileUpload(@RequestParam Integer formId, @RequestParam Integer pageId, ModelMap map){		
		
		FormFile file =new FormFile();
		
		List<String> types = new ArrayList<String>(1);
		types.add("PDF");
		
		map.put("formId", formId);
		map.put("pageId", pageId);
		map.put("formFile", file);
		map.put("types", types);
		return "element/addFileUpload";	
	}
	
	@RequestMapping(value="element/addFileUpload.html",method = RequestMethod.POST)
	private String addFileUpload( @ModelAttribute FormFile formFile, @RequestParam Integer pageId, @RequestParam Integer formId, SessionStatus status){
		
		formFile.setForm(formDao.getForm(formId));
		FormElement savedElement = elementDao.saveElement(formFile);
		
		Page changedPage = pageDao.getPage(pageId);
		List<FormElement> elements=changedPage.getElements();
		elements.add(savedElement);
		changedPage = pageDao.savePage(changedPage);
		
		status.setComplete();
		
		return "redirect:list.html?formId="+formId+"&pageId="+pageId;				
	}
	
	@RequestMapping(value="element/editFileUpload.html",method = RequestMethod.GET)
	private String editFileUpload(@RequestParam Integer elementId, @RequestParam Integer formId, @RequestParam Integer pageId, ModelMap map){		
		
		Map<String, String> param = new HashMap<>(1);
		param.put("id", elementId.toString());
		FormFile curElement = formfileDao.findByCriteria(param, FormFile.class);
		
		List<String> types = new ArrayList<String>(1);		
		types.add("PDF");
		
		map.put("formFile", curElement);
		map.addAttribute("pageId", pageId);
		map.addAttribute("formId", formId);
		map.put("types", types);
		
		return "element/editFileUpload";	
	}
	
	@RequestMapping(value="element/editFileUpload.html",method = RequestMethod.POST)
	private String editFileUpload(@ModelAttribute FormFile formFile,@RequestParam Integer elementId, @RequestParam Integer pageId, @RequestParam Integer formId, SessionStatus status){
				
		formfileDao.update(formFile);
		status.setComplete();	
		
		return "redirect:list.html?formId="+formId+"&pageId="+pageId;				
	}
	
		
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
		return "element/addTextbox";
	}
	
	@RequestMapping(value="/element/addTextbox.html",method = RequestMethod.POST)
	private String addTextbox( @ModelAttribute Textbox textbox,@RequestParam Integer pageId, @RequestParam Integer formId, SessionStatus status){
		FormElement savedElement = elementDao.saveElement(textbox);
		
		Page changedPage = pageDao.getPage(pageId);
		List<FormElement> elements=changedPage.getElements();
		elements.add(savedElement);
		changedPage = pageDao.savePage(changedPage);
		
		status.setComplete();
		
		 return "redirect:list.html?formId="+formId+"&pageId="+pageId;		
	}


	@RequestMapping(value="/element/editTextbox.html",method = RequestMethod.GET)
	private String editTextbox(@RequestParam Integer elementId, @RequestParam Integer pageId, @RequestParam Integer formId, ModelMap model){
		
		Textbox curElement = (Textbox)elementDao.getElement(elementId);
		
		model.put("textbox", curElement);
		model.addAttribute("pageId", pageId);
		model.addAttribute("formId", formId);
		
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
		
		elementDao.delete(curElement);
		
		
		return "redirect:list.html?formId="+formId+"&pageId="+pageId;
	}

	@RequestMapping(value="/element/addCheckbox.html",method = RequestMethod.GET)
	private String addCheckbox(@RequestParam Integer pageId, @RequestParam Integer formId,ModelMap model){
	
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
		
		return "element/addCheckbox";
	}
	
	@RequestMapping(value="/element/addCheckbox.html",method = RequestMethod.POST)
	private String addCheckbox( @ModelAttribute MultipleChoice changedElement,@RequestParam Integer pageId, @RequestParam Integer formId, SessionStatus status)
	{

		FormElement savedElement = elementDao.saveFormElement(changedElement);

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
		
		List<Choice> choices = choiceDao.getChoices(elementId);
		
		model.put("multiplechoice", multiplechoice);
		model.put("choices", choices);
		model.addAttribute("pageId", pageId);
		model.addAttribute("formId", formId);
		model.addAttribute("elementId", elementId);
		
		return "element/editCheckbox";
	}
	
	@RequestMapping(value="/element/editCheckbox.html",method = RequestMethod.POST)
	private String editCheckbox( @ModelAttribute MultipleChoice changedElement, @RequestParam Integer pageId, @RequestParam Integer formId, @RequestParam Integer elementId, SessionStatus status)
	{

		elementDao.saveFormElement(changedElement);

		status.setComplete();
		
		return "redirect:list.html?formId="+formId+"&pageId="+pageId;
	
	}
}
