# dio-bd-oficina
### Tabela Clientes:

Armazena informações sobre os clientes da oficina.
Inclui detalhes como nome, tipo de cliente (Pessoa Física ou Jurídica), CPF/CNPJ, endereço, email e telefone.
Registra a data de cadastro do cliente.
### Tabela Veículos:

Armazena informações sobre os veículos dos clientes.
Registra a marca, modelo, ano de fabricação, placa, cor e o ID do cliente a quem o veículo pertence.
Estabelece uma relação com a tabela Clientes para associar os veículos aos seus proprietários.
### Tabela Serviços:

Registra informações sobre os serviços de manutenção oferecidos pela oficina.
Inclui o nome do serviço, descrição, preço e data de cadastro.
### Tabela Agendamentos:

Registra os agendamentos de serviços para veículos.
Contém informações como o ID do cliente, ID do veículo, ID do serviço, data e hora do agendamento e status.
Estabelece relações com as tabelas Clientes, Veículos e Serviços para vincular informações relevantes.
### Tabela Pagamentos:

Registra os pagamentos feitos pelos clientes.
Inclui o ID do cliente, valor do pagamento e data do pagamento.
Estabelece uma relação com a tabela Clientes para associar os pagamentos aos clientes correspondentes.
### Tabela HistoricoServicos:

Registra o histórico de serviços executados nos veículos.
Inclui informações como ID do cliente, ID do veículo, ID do serviço, data de execução, e valor do serviço.
Estabelece relações com as tabelas Clientes, Veículos e Serviços para registrar os detalhes dos serviços realizados.
### Tabela Mecanicos:

Armazena informações sobre os mecânicos da oficina.
Inclui o nome, especialidade, telefone e email do mecânico.
O campo de email é único para garantir que não haja duplicatas.
### Tabela ServicosMecanicos:

Registra os serviços de manutenção executados por mecânicos.
Inclui o ID do serviço, ID do mecânico, data de execução do serviço e valor do serviço.
Estabelece relações com as tabelas Serviços e Mecânicos para associar os serviços aos mecânicos responsáveis.
### Tabela Avaliacoes:

Registra as avaliações dos clientes sobre os serviços prestados.
Inclui o ID do cliente, comentário, nota (avaliação de 1 a 5) e data da avaliação.
Estabelece uma relação com a tabela Clientes para associar as avaliações aos clientes correspondentes.

#### Este esquema de banco de dados permite que a oficina mecânica gerencie efetivamente seus clientes, veículos, agendamentos, serviços, pagamentos, histórico de serviços, mecânicos e avaliações. 
