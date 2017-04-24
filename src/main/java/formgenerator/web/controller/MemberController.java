package formgenerator.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import formgenerator.model.AssignedForm;
import formgenerator.model.Form;
import formgenerator.model.Member;
import formgenerator.model.Role;
import formgenerator.model.dao.AssignFormDAO;
import formgenerator.model.dao.FormDAO;
import formgenerator.model.dao.MemberDAO;
import formgenerator.web.validator.MemberValidator;

@Controller
@SessionAttributes("member")
public class MemberController {

	@Autowired
	private MemberDAO memberDao;
	
	@Autowired
	private MemberValidator memberValidator;
	
	@Autowired
	private FormDAO formDao;
	
	@Autowired
	private AssignFormDAO assignFormDao;
	
	private BCryptPasswordEncoder bCryptPasswordEncoder =  null;

	@RequestMapping("/member/list.html")
	private String list(ModelMap model) {
		List<Member> members = memberDao.getMembers();

		model.put("members", members);
		model.addAttribute("menu",
				"<a style='color: white' href='./list.html'>Users</a>&nbsp;&nbsp;<a style='color: white' href='../form/list.html'>Forms</a>");

		return "member/list";
	}

	@RequestMapping(value = "/member/view.html", method = RequestMethod.GET)
	private String view(@RequestParam Integer id, ModelMap model) {
		Member member = memberDao.getMember(id);

		model.put("member", member);
		model.addAttribute("menu",
				"<a style='color: white' href='./list.html'>Users</a>&nbsp;&nbsp;<a style='color: white' href='../form/list.html'>Forms</a>");

		return "member/view";
	}

	@RequestMapping(value = "/member/add.html", method = RequestMethod.GET)
	@PreAuthorize("hasAuthority('Admin')")
	private String add(ModelMap model) {
		
		Member member = new Member();
		Role role = new Role();
		member.setRoles(role);
		model.put("member", new Member());
		model.put("roles", Role.getRoles());
		model.addAttribute("menu",
				"<a style='color: white' href='./list.html'>Users</a>&nbsp;&nbsp;<a style='color: white' href='../form/list.html'>Forms</a>");

		return "member/add";
	}

	@RequestMapping(value = "/member/add.html", method = RequestMethod.POST)
	@PreAuthorize("hasAuthority('Admin')")
	private String add(@ModelAttribute Member member, BindingResult bindingResult) {
		
		memberValidator.validate(member, bindingResult);
		
		if(bindingResult.hasErrors()) 
			return "member/add"; 
		
		if(bCryptPasswordEncoder ==null)
			bCryptPasswordEncoder = new BCryptPasswordEncoder();
		
		member.setPassword(bCryptPasswordEncoder.encode(member.getPassword()));
		memberDao.saveMember(member);

		return "redirect:list.html";
	}

	@RequestMapping(value = "/member/edit.html", method = RequestMethod.GET)
	@PreAuthorize("hasAuthority('Admin') || principal.username == #member.username")
	private String edit(@RequestParam Integer id, ModelMap model) {
		
		model.put("member", memberDao.getMember(id));
		model.put("roles", Role.getRoles());
		model.addAttribute("menu",
				"<a style='color: white' href='./list.html'>Users</a>&nbsp;&nbsp;<a style='color: white' href='../form/list.html'>Forms</a>");

		return "member/edit";
	}

	@RequestMapping(value = "/member/edit.html", method = RequestMethod.POST)
	@PreAuthorize("hasAuthority('Admin') || principal.username == #member.username")
	private String edit(@ModelAttribute Member member, SessionStatus status, BindingResult bindingResult) {
		
		memberValidator.validate(member, bindingResult);
		
		if(bindingResult.hasErrors()) 
			return "member/add"; 
		
		if(bCryptPasswordEncoder == null)
			bCryptPasswordEncoder = new BCryptPasswordEncoder();
		
		member.setPassword(bCryptPasswordEncoder.encode(member.getPassword()));
		memberDao.saveMember(member);

		status.setComplete();
		return "redirect:list.html";
	}

	@RequestMapping(value = "/member/delete.html", method = RequestMethod.GET)	
	private String edit(@RequestParam Integer memberId) {
		Member member = memberDao.getMember(memberId);
		memberDao.delete(member);

		return "redirect:list.html";
	}
	
	@RequestMapping(value = "/member/assign.html", method = RequestMethod.GET)	
	private String assign(ModelMap map) {
		
		map.put("assignForm", new AssignedForm());
		
		map.put("members", memberDao.getMembers());
		map.put("forms", formDao.getForms());
		
		return "member/assign";
	}
	
	@RequestMapping(value = "/member/assign.html", method = RequestMethod.POST)	
	private String assign(@ModelAttribute AssignedForm assignForm) {
		
		Member member = memberDao.getMember(assignForm.getMember().getId());
		Form form = formDao.getForm(assignForm.getForm().getId());		
		assignForm.setMember(member);
		assignForm.setForm(form);
		
		assignFormDao.saveAssigned(assignForm);		
		return "redirect:list.html";
	}
}