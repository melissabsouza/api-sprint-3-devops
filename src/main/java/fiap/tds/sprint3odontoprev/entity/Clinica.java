package fiap.tds.sprint3odontoprev.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
@Entity
@Table(name = "T_CHALLENGE_CLINICA")
public class Clinica {
    @Id
    @Column(name = "cnpj_clinica", unique = true, nullable = false)
    @Pattern(regexp = "([0-9]{2}[\\.]?[0-9]{3}[\\.]?[0-9]{3}[\\/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[\\.]?[0-9]{3}[\\.]?[0-9]{3}[-]?[0-9]{2})",
    message = "use 00000000000, 00000000000000, 000.000.000-00, 00.000.000/0000-00 e até 000000000-00 ou 00000000/0000-00")
    private String cnpj;

    @Size(min = 3, message = "O nome deve ter pelo menos 5 caracteres")
    @NotBlank(message = "O nome não pode ser vazio")
    @NotNull(message = "O nome não pode ser nulo")
    @Column(name = "nome_clinica", length = 100, nullable = false)
    private String nome;

    @OneToOne
    @JoinColumn(name = "id_usuario", referencedColumnName = "id_usuario", nullable = false)
    @NotNull(message = "O id do usuário não pode ser nulo")
    private Usuario usuario;

    @OneToOne
    @JoinColumn(name = "id_endereco", referencedColumnName = "id_endereco", nullable = false)
    @NotNull(message = "O id do endereço não pode ser nulo")
    private Endereco endereco;

    @OneToOne
    @JoinColumn(name = "id_telefone", referencedColumnName = "id_telefone")
    @NotNull(message = "O id do telefone não pode ser nulo")
    private Telefone telefone;


}
