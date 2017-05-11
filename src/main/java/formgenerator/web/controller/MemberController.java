package formgenerator.web.controller;

import java.security.Principal;
import java.util.HashMap;
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
import formgenerator.web.validator.PasswordValidator;

@Controller
@SessionAttributes("member")
public class MemberController {

	@Autowired
	private MemberDAO memberDao;
	
	@Autowired
	private MemberValidator memberValidator;
	
	@Autowired
	private PasswordValidator passwordValidator;
	
	@Autowired
	private FormDAO formDao;
	
	@Autowired
	private AssignFormDAO assignFormDao;
	
	private BCryptPasswordEncoder bCryptPasswordEncoder =  null;

	@RequestMapping("/member/list.html")
	private String list(ModelMap model) {
			
		List<Member> members = memberDao.getMembers();
		model.put("members",  members);
		
		members.forEach(member -> {
			System.out.println("The user is " +member.getId() + "And assigned form is : " +member.getAssignedForm().size());
		});
		
		return "member/list";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, ModelMap model) {
		
		if (error != null) {
			model.put("error", "Invalid username and/or password.");
		}

		if (logout != null) {
			model.put("msg", "You've been logged out successfully.");
		}
		
		System.out.print("In Login web controller");
		return "member/login";

	}	

	@RequestMapping(value = "/member/view.html", method = RequestMethod.GET)
	private String view(@RequestParam Integer id, ModelMap model) {
		
		model.put("member", memberDao.getMember(id));
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

		return "member/add";
	}

	@RequestMapping(value = "/member/add.html", method = RequestMethod.POST)
	@PreAuthorize("hasAuthority('Admin')")
	private String add(@ModelAttribute Member member, BindingResult bindingResult) {
		
		memberValidator.validate(member, bindingResult);
		
		if(bindingResult.hasErrors()) 
			return "redirect:member/add.html"; 
		
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
		return "member/edit";
	}

	@RequestMapping(value = "/member/edit.html", method = RequestMethod.POST)
	@PreAuthorize("hasAuthority('Admin') || principal.username == #member.username")
	private String edit(@ModelAttribute Member member, SessionStatus status, BindingResult bindingResult) {
		
		memberValidator.validate(member, bindingResult);
		
		if(bindingResult.hasErrors()) 
			return "member/add"; 
		
		if(bCryptPasswordEncoder ==null)
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
		map.put("forms", formDao.findByNamedQuery("assigned.form.by.named.query", new HashMap<String, String>(1)));
		
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
	
	@RequestMapping(value = "/member/unassign.html", method = RequestMethod.GET)	
	private String unassign(@RequestParam Integer assignmentId) {
		
		AssignedForm assign = assignFormDao.getAssignment(assignmentId);		
		assign.setForm(null);
		assign.setMember(null);
		
		return "redirect:list.html";
	}
	
	@RequestMapping(value = "/member/updatepassword.html", method = RequestMethod.GET)	
	private String updatePassword(ModelMap model, Principal principal) {
		String username = principal.getName();
		model.put("member", memberDao.getMemberbyUserName(username));
		return "member/updatePassword";
	}
	
	@RequestMapping(value = "/member/updatepassword.html", method = RequestMethod.POST)	
	private String updatePassword(@ModelAttribute Member member, BindingResult bindingResult) {
		
		passwordValidator.validate(member, bindingResult);
		
		if(bindingResult.hasErrors()) 
			return "member/updatePassword"; 
		
		if(bCryptPasswordEncoder ==null)
			bCryptPasswordEncoder = new BCryptPasswordEncoder();
		
		member.setPassword(bCryptPasswordEncoder.encode(member.getPassword()));
		memberDao.saveMember(member);
		
		return "redirect:../form/list.html";
	}
	
}













