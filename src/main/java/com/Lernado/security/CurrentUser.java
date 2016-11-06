package com.Lernado.security;

import com.Lernado.model.User;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;


public class CurrentUser extends User implements UserDetails {


    public CurrentUser(User user) {
        super(user.getIduser(), user.getEmail(), user.getPassword(), user.getName(), user.getSurname(), user.getNickName(), user.getInterest(), user.getDescription(), user.getPhoneNumber(), user.getPhotoBinary(), user.getCoursesByIduser(), user.getAttendedCourses(), user.getWishedCourses(), user.getJoinedRooms());
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return AuthorityUtils.createAuthorityList("USER");
    }

    @Override
    public String getPassword() {
        return super.getPassword();
    }

    @Override
    public String getUsername() {
        return super.getEmail();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
