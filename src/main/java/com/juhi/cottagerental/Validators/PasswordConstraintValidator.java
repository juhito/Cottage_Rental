package com.juhi.cottagerental.Validators;

import org.passay.*;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

public class PasswordConstraintValidator implements ConstraintValidator<ValidPassword, String> {
    @Override
    public void initialize(ValidPassword constraintAnnotation) {

    }

    @Override
    public boolean isValid(String password, ConstraintValidatorContext context) {

        Properties props = new Properties();
        InputStream inputStream = getClass()
                .getClassLoader()
                .getResourceAsStream("passay.properties");
        try {
            props.load(inputStream);
            MessageResolver resolver = new PropertiesMessageResolver(props);

            PasswordValidator validator = new PasswordValidator(resolver, Arrays.asList(
                    // Length between 6 and 16 characters
                    new LengthRule(6, 16),

                    // At least one digit
                    new CharacterRule(EnglishCharacterData.Digit, 1),

                    // No whitespace
                    new WhitespaceRule()
            ));

            RuleResult result = validator.validate(new PasswordData(password));

            if(result.isValid())
                return true;

            List<String> messages = validator.getMessages(result);
            String messageTemplate = String.join(",", messages);
            context.buildConstraintViolationWithTemplate(messageTemplate)
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
        } catch(IOException ignored) {

        }

        return false;
    }
}
