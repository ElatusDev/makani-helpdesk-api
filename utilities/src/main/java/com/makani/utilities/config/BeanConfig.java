package com.makani.utilities.config;

import com.google.i18n.phonenumbers.PhoneNumberUtil;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;


import java.util.Locale;

@Configuration
public class BeanConfig {
    public static final String LOCALE_LANGUAGE = "es-MX";

    @Bean
    public MessageSource messageSource() {
        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
        messageSource.setBasenames(
                "classpath:messages/people_messages",
                "classpath:messages/security_messages",
                "classpath:messages/coordination_messages"
        );
        messageSource.setDefaultEncoding("UTF-8");
        messageSource.setCacheSeconds(-1);
        messageSource.setDefaultLocale(Locale.forLanguageTag(LOCALE_LANGUAGE));
        return messageSource;
    }

    public PhoneNumberUtil phoneNumberUtil(){
        return PhoneNumberUtil.getInstance();
    }
}
