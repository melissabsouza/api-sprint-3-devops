package fiap.tds.sprint3odontoprev.repository;

import fiap.tds.sprint3odontoprev.entity.Endereco;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface EnderecoRepository  extends JpaRepository<Endereco, Long> {
}
