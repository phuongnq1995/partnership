package org.partnership.converter;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class AuthSuccessHandler implements AuthenticationSuccessHandler{

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, 
      Authentication authentication) 
      throws ServletException, IOException {
    	clearAuthenticationAttributes(request);
        response.setStatus(HttpServletResponse.SC_OK);
        response.getWriter().print(isAdminPage(authentication));
        response.getWriter().flush();
    }
    
    protected String isAdminPage(Authentication authentication) {
        Collection<? extends GrantedAuthority> authorities
         = authentication.getAuthorities();
        for (GrantedAuthority grantedAuthority : authorities) {
            if (grantedAuthority.getAuthority().equals("ROLE_ADMIN")) {
                return "isAdmin";
            }
        }
        return "isUser";
    }
    
    protected void clearAuthenticationAttributes(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return;
        }
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
    }
 
    public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
        this.redirectStrategy = redirectStrategy;
    }
    protected RedirectStrategy getRedirectStrategy() {
        return redirectStrategy;
    }
}
