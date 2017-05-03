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

import formgenerator.model.Page;
import formgenerator.model.dao.FormDAO;
import formgenerator.model.dao.PageDAO;

@Controller
@SessionAttributes("page")
public class PageController {

	@Autowired
	private PageDAO pageDao;
	@Autowired
	private FormDAO formDao;
	
	private byte count;

	@RequestMapping("/page/list.html")
	private String list(@RequestParam Integer formId, ModelMap model) {
		
		if (formId > 0) {
			List<Page> pages = pageDao.getPages(formId);
			model.put("pages", pages);
			model.addAttribute("formId", formId);			
			return "page/list";
		} else {
			return "form/list";
		}

	}

	@RequestMapping(value = "/page/add.html", method = RequestMethod.GET)
	private String add(ModelMap model, @RequestParam Integer formId) {
		Page page = new Page();
		
		List<Page> pages = pageDao.getPages(formId);
		
		if(pages != null && pages.size() >= 0){
			page.setNumber(Byte.valueOf(Integer.toString(pages.size()+1)));
		}else{
			page.setNumber(Byte.valueOf("1"));
		}
			
		model.put("page", page);
		model.addAttribute("formId", formId);		
		return "page/add";
	}

	@RequestMapping(value = "/page/add.html", method = RequestMethod.POST)
	private String add(@ModelAttribute Page page, @RequestParam Integer formId) {
		page.setForm(formDao.getForm(formId));
		pageDao.savePage(page);

		return "redirect:list.html?formId=" + formId;
	}

	@RequestMapping(value = "/page/edit.html", method = RequestMethod.GET)
	private String edit(@RequestParam Integer formId, @RequestParam Integer pageId, ModelMap model) {

		model.put("page", pageDao.getPage(pageId));
		model.addAttribute("formId", formId);		

		return "page/edit";
	}

	@RequestMapping(value = "/page/edit.html", method = RequestMethod.POST)
	private String edit(@ModelAttribute Page page, @RequestParam Integer formId, SessionStatus status) {

		pageDao.savePage(page);
		status.setComplete();

		return "redirect:list.html?formId=" + formId;
	}

	@RequestMapping(value = "/page/delete.html", method = RequestMethod.GET)
	private String edit(@RequestParam Integer formId, @RequestParam Integer pageId) {
		
		Page page = pageDao.getPage(pageId);
		pageDao.delete(page);
		
		List<Page> pages = pageDao.getPages(formId);
		count = 1;
		pages.forEach(paper ->{
			paper.setNumber(count);
			pageDao.savePage(paper);
			count++;
		});
		

		return "redirect:list.html?formId=" + formId;
	}

}
