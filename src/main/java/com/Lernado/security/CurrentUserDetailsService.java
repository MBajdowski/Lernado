package com.Lernado.security;

import com.Lernado.managers.AdminRepository;
import com.Lernado.managers.UserRepository;
import com.Lernado.model.Admin;
import com.Lernado.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CurrentUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private AdminRepository adminRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Admin admin = adminRepository.getByEmail(email);
        if(admin !=null){
            return new CurrentUser(admin.getEmail(), admin.getPassword(), admin.getFirstName(), admin.getLastName(), null, null, 0, admin.getIdadmin());
        }else {

            User user = userRepository.getByEmail(email)
                    .orElseThrow(() -> new UsernameNotFoundException(String.format("User with email=%s was not found", email)));
            return new CurrentUser(user.getEmail(), user.getPassword(), user.getFirstName(), user.getLastName(), user.getNickName(), user.getDescription(), user.getPhoneNumber(), user.getIduser());
        }
    }
}
