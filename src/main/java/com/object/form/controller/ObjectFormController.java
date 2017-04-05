package com.object.form.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.object.form.model.Choice;
import com.object.form.model.Form;
import com.object.form.model.MultipleChoice;
import com.object.form.model.Page;
import com.object.form.model.Textbox;
import com.object.form.model.dao.ChoiceDao;
import com.object.form.model.dao.FormDao;
import com.object.form.model.dao.FormElementDao;
import com.object.form.model.dao.PageDao;

@Controller
public class ObjectFormController {

	@Autowired
	private FormDao formdao;

	@Autowired
	private PageDao pagedao;

	@Autowired
	private FormElementDao elementdao;
	
	@Autowired
	private ChoiceDao choicedao;

	@RequestMapping(value = "/login.html", method = RequestMethod.GET)
	public String mainPage() {
		return "login";
	}

	@RequestMapping(value = "/adminpage.html", method = RequestMethod.GET)
	public String adminLogin(ModelMap maps) {
		return "adminpage";
	}

	@RequestMapping(value = "/adminpage.html", method = RequestMethod.POST)
	public String adminLogin() {
		return "adminpage";
	}

	@RequestMapping(value = "/generatenewform.html", method = RequestMethod.GET)
	public String generateNewForm(ModelMap maps) {
		maps.put("form", new Form());
		return "generatenewform";
	}

	@RequestMapping(value = "/generatenewform.html", method = RequestMethod.POST)
	public String generateNewForm(@ModelAttribute Form form) {
		Form newform = form;
		Date createDate = new Date();
		Page page = new Page();
		page.setNumber((byte) 1);
		page.setForm(newform);
		List<Page> pages = new ArrayList<Page>();
		pages.add(page);
		newform.setCreatedDate(createDate);
		newform.setPages(pages);

		formdao.saveForm(newform);
		return "redirect:generatedforms.html";
	}

	@RequestMapping(value = "/generatedforms.html", method = RequestMethod.GET)
	public String generatedForms(ModelMap model) {
		model.put("forms", formdao.getForms());
		return "generatedforms";
	}

	@RequestMapping(value = "/removeform.html")
	public String removeForm(@RequestParam Integer id) {
		formdao.delete(formdao.getForm(id));
		return "redirect:generatedforms.html";
	}

	@RequestMapping(value = "/form/editform.html", method = RequestMethod.GET)
	public String editForm(@RequestParam Integer id, ModelMap models) {
		models.put("form", formdao.getForm(id));
		return "form/editform";
	}

	@RequestMapping(value = "/form/editform.html", method = RequestMethod.POST)
	public String editForm(@ModelAttribute Form form, @RequestParam Integer id) {
		Form editform = form;
		Date modDate = new Date();
		editform.setModifiedDate(modDate);
		editform.setCreatedDate(formdao.getForm(id).getCreatedDate());
		formdao.saveForm(editform);

		return "redirect:../generatedforms.html";
	}

	@RequestMapping(value = "/page/pagelistview.html", method = RequestMethod.GET)
	public String viewPages(ModelMap models) {
		models.put("pages", pagedao.getPages());
		return "page/pagelistview";
	}

	@RequestMapping(value = "/page/pageview.html", method = RequestMethod.GET)
	public String viewPage(@RequestParam Integer id, ModelMap models) {
		models.put("pages", pagedao.getPagesByFormID(id));
		return "page/pageview";
	}

	@RequestMapping(value = "/page/addpage.html", method = RequestMethod.GET)
	public String addPage(ModelMap models) {
		models.put("page", new Page());
		return "page/addpage";
	}

	@RequestMapping(value = "/page/addpage.html", method = RequestMethod.POST)
	public String addPage(@ModelAttribute Page page) {
		pagedao.savePage(page);
		return "redirect:pagelistview.html";
	}

	@RequestMapping(value = "/page/deletepage.html")
	public String addPage(@RequestParam Integer id) {
		pagedao.delete(pagedao.getPage(id));
		return "redirect:pagelistview.html";
	}

	@RequestMapping(value = "/page/editpage.html", method = RequestMethod.GET)
	public String editPage(@RequestParam Integer id, ModelMap models) {
		models.put("page", pagedao.getPage(id));
		return "page/editpage";
	}

	@RequestMapping(value = "/page/editpage.html", method = RequestMethod.POST)
	public String editPage(@ModelAttribute Page page, @RequestParam Integer id) {
		Page editPage = page;
		editPage.setForm(pagedao.getPage(id).getForm());
		pagedao.savePage(editPage);
		return "redirect:generatedforms.html";
	}

	@RequestMapping(value = "/form/formelementlist.html", method = RequestMethod.GET)
	public String displayElements(@RequestParam Integer id, ModelMap models) {
		models.put("elements", pagedao.getElementsByPageId(id));
		models.put("page", pagedao.getPage(id));
		return "/form/formelementlist";
	}

	@RequestMapping(value = "/form/textbox.html", method = RequestMethod.GET)
	public String addTextBox(ModelMap models) {
		Textbox addElement = new Textbox();
		models.put("element", addElement);
		return "form/textbox";
	}

	@RequestMapping(value = "/form/textbox.html", method = RequestMethod.POST)
	public String addTextBox(@ModelAttribute Textbox element, @RequestParam Integer id) {
		Textbox newElement = element;
		Page linkpage = pagedao.getPage(id);
		List<Page> pages = new ArrayList<Page>();
		pages.add(linkpage);
		newElement.setPages(pages);
		newElement.setType("textbox");
		elementdao.saveTextBox(newElement);
		return "redirect:formelementlist.html?id=" + id;
	}

	@RequestMapping(value = "/form/edittextbox.html", method = RequestMethod.GET)
	public String editTextBox(@RequestParam Integer id, @RequestParam Integer pid, ModelMap models) {
		models.put("element", elementdao.getFormElementById(id));
		return "form/edittextbox";
	}

	@RequestMapping(value = "/form/edittextbox.html", method = RequestMethod.POST)
	public String editTextBox(@ModelAttribute Textbox element, @RequestParam Integer pid) {
		Textbox editElement = element;
		Page linkpage = pagedao.getPage(pid);
		List<Page> pages = new ArrayList<Page>();
		pages.add(linkpage);
		editElement.setPages(pages);
		editElement.setType("textbox");
		elementdao.saveTextBox(editElement);
		return "redirect:formelementlist.html?id=" + pid;
	}

	@RequestMapping(value = "/form/multiplechoice.html", method = RequestMethod.GET)
	public String addMultipleChoice(ModelMap models, @RequestParam Integer id) {
		MultipleChoice addElement = new MultipleChoice();
		models.put("element", addElement);
		return "form/multiplechoice";
	}

	@RequestMapping(value = "/form/multiplechoice.html", method = RequestMethod.POST)
	public String addMultipleChoice(@ModelAttribute MultipleChoice element, @RequestParam Integer id) {
		MultipleChoice addElement = element;
		Page linkpage = pagedao.getPage(id);
		List<Page> pages = new ArrayList<Page>();
		pages.add(linkpage);
		addElement.setPages(pages);
		if (addElement.getChoiceType() == 1) {
			addElement.setType("checkbox");
		} else if (addElement.getChoiceType() == 2) {

		} else {

		}
		elementdao.saveFormElement(addElement);
		return "redirect:formelementlist.html?id=" + id;
	}

	@RequestMapping(value = "/form/editcheckbox.html", method = RequestMethod.GET)
	public String editMultipleChoice(ModelMap models, @RequestParam Integer id) {
		models.put("element", elementdao.getFormElementById(id));
		return "form/multiplechoice";
	}

	@RequestMapping(value = "/form/editcheckbox.html", method = RequestMethod.POST)
	public String editMultipleChoice(@ModelAttribute MultipleChoice element, @RequestParam Integer pid, @RequestParam Integer id) {
		MultipleChoice addElement = element;
		Page linkpage = pagedao.getPage(pid);
		List<Page> pages = new ArrayList<Page>();
		pages.add(linkpage);
		addElement.setPages(pages);
		if (addElement.getChoiceType() == 1) {
			addElement.setType("checkbox");
		} else if (addElement.getChoiceType() == 2) {

		} else {

		}
		MultipleChoice mc = (MultipleChoice) elementdao.getFormElementById(id);
		addElement.setChoices(mc.getChoices());
		elementdao.saveFormElement(addElement);
		return "redirect:formelementlist.html?id=" + pid;
	}

	@RequestMapping(value = "/form/deleteelement.html")
	public String deleteElement(@RequestParam Integer id, @RequestParam Integer pid) {
		elementdao.delete(elementdao.getFormElementById(id));
		return "redirect:formelementlist.html?id=" + pid;
	}

	@RequestMapping(value = "/choice/choicelist.html", method = RequestMethod.GET)
	public String choiceList(@RequestParam Integer id, @RequestParam Integer pid, ModelMap models) {
		MultipleChoice mc = (MultipleChoice) elementdao.getFormElementById(id);
		Choice newchoice = new Choice();
		if (mc.getChoices() == null) {
			List<Choice> choices = new ArrayList<Choice>();
			mc.setChoices(choices);
		}
		models.put("choices", mc.getChoices());
		models.put("newchoice", newchoice);
		models.put("pid", pid);
		models.put("id", id);
		return "choice/choicelist";
	}

	@RequestMapping(value = "/choice/choicelist.html", method = RequestMethod.POST)
	public String choiceList(@RequestParam Integer id, @RequestParam Integer pid, @ModelAttribute Choice newChoice) {
		Choice c = newChoice;
		MultipleChoice mc = (MultipleChoice) elementdao.getFormElementById(id);
		List<Choice> choices = mc.getChoices();
		choices.add(c);
		mc.setChoices(choices);
		elementdao.saveFormElement(mc);
		return "redirect:choicelist.html?id=" + id + "&pid=" + pid;
	}
	
	@RequestMapping(value = "/choice/deletechoice.html")
	public String deleteChoice(@RequestParam Integer id, @RequestParam Integer pid, @RequestParam Integer cid) {
		MultipleChoice mc = (MultipleChoice) elementdao.getFormElementById(id);
		List<Choice> choices = mc.getChoices();
		choices.remove(choicedao.getChoice(cid));
		mc.setChoices(choices);
		elementdao.saveFormElement(mc);
		choicedao.delete(choicedao.getChoice(cid));
		return "redirect:choicelist.html?id=" + id + "&pid=" + pid;
	}
	
	@RequestMapping(value = "/form/viewform.html")
	public String viewForm(ModelMap models, @RequestParam Integer id) {
		models.put("elements", pagedao.getElementsByPageId(id));
		models.put("page", pagedao.getPage(id));
		return "form/viewform";
	}

}
