package com.juhi.cottagerental.Config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    DataSource dataSource;

    @Autowired
    public void configureSecurity(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication().dataSource(this.dataSource)
                .usersByUsernameQuery("SELECT username, password, enabled FROM user WHERE username=?")
                .authoritiesByUsernameQuery("SELECT user.username AS username, roles.role AS rolename" +
                        " FROM user INNER JOIN user_role ON user.user_id = user_role.user_id" +
                        " INNER JOIN roles ON user_role.role_id = roles.role_id WHERE user.username=?");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            // Admins only
            .authorizeRequests()
            .antMatchers("/admin/**")
            .hasRole("ADMIN")

            // Authenticated access
            .and()
            .authorizeRequests()
            .antMatchers("/user/**")
            .authenticated()

            // Everything else
            .and()
            .authorizeRequests()
            .antMatchers("/**")
            .permitAll()

            .and()
            .formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/perform_login")
                .defaultSuccessUrl("/", true)
                .failureUrl("/login?error")
                .usernameParameter("username")
                .passwordParameter("password")

            .and()
                .logout()
                .logoutSuccessUrl("/login?logout")

            .and()
                .csrf()
            .and()
                .httpBasic();
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
