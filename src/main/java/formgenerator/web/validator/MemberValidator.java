package formgenerator.web.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import formgenerator.model.Member;

@Component
public class MemberValidator implements Validator {
	
	
	private Pattern pattern;
	
	private Matcher matcher;

	private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

	@Override
	public boolean supports(Class<?> clazz) {
		return Member.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		Member member = (Member) target;
						
		if(!StringUtils.hasText(member.getEmail()))
			errors.rejectValue("email", "error.field.emailId");
		
		if(!member.getPassword().equals(member.getConfirmPassword()))
			errors.rejectValue("password", "error.field.password");
		
		if (!(member.getEmail() != null && member.getEmail().isEmpty())) {
			   pattern = Pattern.compile(EMAIL_PATTERN);
			   matcher = pattern.matcher(member.getEmail());
			   if (!matcher.matches()) {
			    errors.rejectValue("email", "error.field.inValidEmailId");
			   }
		}
		
	}

}