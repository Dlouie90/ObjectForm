package formgenerator.web.validator;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import formgenerator.model.Member;

@Component
public class PasswordValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Member.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		Member member = (Member) target;
		
		if(!StringUtils.hasText(member.getPassword()))
			errors.rejectValue("password", "error.field.password");
		
		if(!member.getPassword().equals(member.getConfirmPassword()))
			errors.rejectValue("confirmPassword", "error.field.confirmPassword");
	}

}
