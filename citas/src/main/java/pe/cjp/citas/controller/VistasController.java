package pe.cjp.citas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class VistasController {

    @GetMapping("/login")
    public String login() {
      return "login"; // Redirige a /vistas/login.jsp
    }

    @GetMapping("/citas")
    public String citas() {
      return "citas"; 
    }

    @GetMapping("/index")
    public String index() {
      return "index"; 
    }
    


}
