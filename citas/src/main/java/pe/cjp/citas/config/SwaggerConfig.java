//*****************************************************
// ACA SE CAMBIO TODO EL CODIGO QUE HABIA INICIALMENTE
package pe.cjp.citas.config;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.security.SecurityScheme;
import io.swagger.v3.oas.annotations.enums.SecuritySchemeType;
import org.springframework.context.annotation.Configuration;

@Configuration
@OpenAPIDefinition(
    info = @Info(
        title = "Gestión de Reservas de Citas Médicas",
        version = "1.0",
        description = "Esta API permite gestionar pacientes, médicos, disponibilidad médica, especialidades y citas médicas."
    ),
    security = {
        @SecurityRequirement(name = "apiKeyAuth")
    }
)
@SecurityScheme(
    name = "apiKeyAuth",
    type = SecuritySchemeType.APIKEY,
    in = io.swagger.v3.oas.annotations.enums.SecuritySchemeIn.HEADER,
    paramName = "X-API-KEY"
)
public class SwaggerConfig {
}

//*****************************************************