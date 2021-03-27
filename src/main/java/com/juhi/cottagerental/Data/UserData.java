package com.juhi.cottagerental.Data;

import com.juhi.cottagerental.Validators.FieldMatch;
import com.juhi.cottagerental.Validators.ValidPassword;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

@FieldMatch.List({
    @FieldMatch(
        first = "password",
        second = "confirmPassword",
        message = "The password fields must match"
    )
})
public class UserData implements Serializable {

    @NotNull
    @NotBlank
    private String name;

    @NotNull
    @NotBlank
    private String username;

    @ValidPassword
    @NotNull
    @NotBlank
    private String password;

    @ValidPassword
    @NotNull
    @NotBlank
    private String confirmPassword;

    @NotNull
    @NotEmpty
    @Email
    private String email;

    @NotNull(message = "kaunista.... erittäin kaunista")
    private Byte enabled = 1;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Byte getEnabled() {
        return enabled;
    }

    public void setEnabled(Byte enabled) {
        this.enabled = enabled;
    }
}
