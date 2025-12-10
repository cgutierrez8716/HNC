
//*****************************************************
 // ACA SE CREO TODO EL ARCHIVO PORQUE NO EXISTIA


 package pe.cjp.citas.security;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

@Component
public class ApiKeyFilter extends OncePerRequestFilter {

    @Value("${app.security.api-key}")
    private String apiKey;

    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain)
            throws ServletException, IOException {

        String path = request.getRequestURI();

        // 🔥 EXCEPCIONES IMPORTANTES (Swagger y recursos estáticos)
        if (path.startsWith("/swagger-ui")
                || path.startsWith("/v3/api-docs")
                || path.startsWith("/api-docs")
                || path.startsWith("/swagger-resources")
                || path.startsWith("/webjars")
                || path.equals("/")
                || path.equals("/index")
                || path.startsWith("/css/")
                || path.startsWith("/js/")
                || path.startsWith("/images/")) {

            filterChain.doFilter(request, response);
            return;
        }

        // 🔒 Validar solo rutas de API
        if (path.startsWith("/api/")) {
            String header = request.getHeader("X-API-KEY");

            if (header == null || !header.equals(apiKey)) {
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                response.setContentType("application/json");
                response.getWriter().write("{\"error\":\"API KEY inválida o faltante\"}");
                return;
            }
        }

        filterChain.doFilter(request, response);
    }
}


