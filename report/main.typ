#import "cover.typ": cover
#import "template.typ": *

#show: project

#cover(title: "Valhala", authors: (
  (name: "Afonso Santos", number: "a104276"), 
  (name: "João Lobo", number: "a104356"), 
  (name: "Mariana Rocha", number: "a90817"),
  (name: "Rita Camacho", number: "a104439")), 
  "Novembro, 2024")

#set page(numbering: "i", number-align: center)
#counter(page).update(1)

#heading(numbering: none, outlined: false)[Resumo]
Este relatório apresenta o desenvolvimento inicial de um sistema de gestão para a empresa Valhala, especializada na produção e comercialização de móveis, focada na sua montagem. Desde a identificação de necessidades até o desenvolvimento de protótipos, todas as fases fundamentais foram consideradas para assegurar que o sistema satisfaça os requisitos de diversos utilizadores, como clientes, gestores, funcionários e fornecedores. A estrutura robusta do sistema é garantida pela correspondência do modelo lógico da base de dados e dos _casos de uso_, garantindo eficácia e funcionalidade. A tarefa feita estabelece o alicerce necessário para a execução do sistema, que será a etapa subsequente deste projeto. 

\

*Área de Aplicação*: Gestão Operacional de Produção; Gestão de _Stock_ e Logística; Atendimento ao Cliente; Administração e Gestão de Recursos Humanos; Vendas e Comercialização de Produtos

*Palavras-Chave*: Gestão de Mobiliário, Linha de Montagem, Base de Dados, _Mockups_, Modelação Lógica de Base de Dados, Casos de Uso.


#show outline: it => {
    show heading: set text(size: 18pt)
    it
}

#{
  show outline.entry.where(level: 1): it => {
    v(5pt)
    strong(it)
  }

  outline(
    title: [Índice], 
    indent: true, 
  )
}

#v(-0.4em)
#outline(
  title: none,
  target: figure.where(kind: "attachment"),
  indent: n => 1em,
)

#outline(
  title: [Lista de Figuras],
  target: figure.where(kind: image),
)

#outline(
  title: [Lista de Tabelas],
  target: figure.where(kind: table),
)

// Make the page counter reset to 1
#set page(numbering: "1", number-align: center)
#counter(page).update(1)


= Introdução

Este relatório apresenta detalhadamente o desenvolvimento inicial do sistema de gestão da linha de montagem da empresa Valhala, especializada na produção de mobiliário.

Durante este relatório, tratamos desde a identificação dos requisitos e construção do sistema até à elaboração de esboços de interfaces que preveem o design e a operação da aplicação. Cada fase foi minuciosamente planeada para garantir que o sistema seja operacional, expansível e adequado às necessidades específicas dos diversos utilizadores.

Este documento é essencial para o progresso do sistema, pois atua como um guia tanto para a execução técnica como para a confirmação dos requisitos, garantindo que o resultado final corresponde às expectativas de Valhala.

== Apresentação do Caso de Estudo

A empresa escolhida para o estudo é a empresa *Valhala*, que se dedica ao fabrico e comercialização de mobiliário. A empresa está a lidar com obstáculos ligados ao controlo da linha de produção, administração de _stock_, comunicação com fornecedores e suporte ao cliente.

O sistema criado tem como finalidade centralizar a administração de dados e atividades, melhorando procedimentos como rastreamento de pedidos, controlo de montagem, reposição de peças e gestão de funcionários. Disponibiliza funcionalidades específicas para cada utilizador atendendo às diferentes necessidades de cada perfil e promovendo maior eficiência e transparência em todas as etapas do negócio.


== Estrutura do Relatório

Este relatório está estruturado de maneira clara e sequencial, onde são apresentadas todas as etapas realizadas no desenvolvimento do sistema para a empresa Valhala. Assim, terá 6 capítulos: o primeiro introduz o projeto; o segundo capítulo aborda a definição dos requisitos do sistema; o terceiro capítulo apresenta a especificação e modelação do sistema com o uso de diagramas; no quarto capítulo podemos encontrar a conceção do sistema de base de dados; o quinto capítulo descreve as interfaces através de _mockups_; e, por fim, o sexto capítulo, onde é concluído o relatório, refletindo o trabalho realizado e apresentando os próximos passos para a implementação do sistema.

== Contextualização

Envolvida pelo frio gélido sueco, e à procura de conforto e calor, surge *Valhala*, a mais recente e bem sucedida empresa escandinava, especializada na criação de móveis especiais e aconchegantes, enaltecendo cada vez mais casas e espaços interiores.

A 27 de novembro de 2004, enquanto as auroras já dançavam na escuridão da noite (e do dia), Odin Asgard decide criar Valhala, permanecendo desde então CEO da mesma. Há muito que desejava criar móveis sofisticados, acessíveis a todos, encontrando-se insatisfeito com o estado atual da decoração de sua casa.

Valhala localiza-se no centro de Estocolmo, em Gamla Stan, maravilhando os turistas com os seus produtos inovadores, mas especialmente os locais, que a escolhem incessantemente como marca de requinte para decorar as suas casas.

A sede, resguardada como segredo nos confins da loja aberta ao público, é embelezada pela característica varanda panorâmica, coberta por uma cúpula, permitindo observar as auroras boreais iluminando a cidade, colorindo o espaço de Valhala mal o sol desaparece.

O interior, reconhecido pelos seus tons frios e brilhantes, é enaltecido pelas madeiras características da marca, escuras e de boa qualidade. Em contraste, as paredes que rodeiam a sede são claras, frias, abraçando a noite e as auroras ocasionais. Um perfume de café e rolinhos de canela dança por Valhala, ambos oferecidos a todos os funcionários diariamente como sobremesa.

Os seus produtos, embora apresentem uma natureza simples, valorizam os detalhes tradicionais e qualidade dos materiais, recorrendo às melhores madeiras suecas e aos artesãos mais qualificados do país para o seu fabrico.

Mas esta marca especial não realiza vendas comuns. De modo a apelar à sustentabilidade, os produtos são apenas amostras: caso os clientes desejem o móvel, terão de proceder à sua encomenda.

Assim, Valhala oferece um sistema de linha de montagem, valioso e contemporâneo, ajudando os seus funcionários e fornecedores no fabrico e montagem dos mesmos, após receberem as encomendas. Quando os móveis estão concluídos, são entregues pela empresa externa ValquiriaExpress.

Valhala alcança sofisticação em tudo o que cria e realiza - o equilíbrio entre acolher o futuro e relembrar o passado é encontrado em todos os seus móveis, mantendo igualmente olho no nosso mundo.

== Motivação e objetivos

A empresa Valhala implementa um sistema de gestão na linha de montagem com diversas motivações e objetivos estratégicos, que visa otimizar as operações e melhorar o serviço para clientes e funcionários. 

A seguir, são apresentadas as principais motivações e objetivos:

=== Motivações

- *Facilitar a visualização e compreensão do processo pelos funcionários:*
    
    É essencial para os funcionários compreenderem o fluxo de trabalho e acompanharem o progresso em tempo real, a fim de gerir eficazmente uma linha de montagem. Adicionalmente, a eficiência pode ser melhorada e os erros humanos reduzidos ao fornecer uma interface clara e intuitiva com as etapas do processo incluídas, ajudando também a melhorar o ambiente de trabalho. 
     

- *Reconhecimento dos funcionários e clientes:*
    
    Ao comemorar o vigésimo aniversário da fundação da empresa, esta deseja motivar tanto os seus funcionários bem como os seus clientes com um produto de reconhecimento de alta qualidade. O _software_ que será desenvolvido permitirá organizar a montagem dos produtos, garantindo que estes sejam fabricados e distribuídos de maneira eficiente. Adicionalmente, os clientes terão a possibilidade de acompanhar cada fase do processo de montagem das suas encomendas.
    
- *Garantir a qualidade do produto em todas as fases:*
    
    Garantir que a qualidade do produto é mantida em todas as etapas do processo de montagem é uma das principais razões para adotar um sistema de gestão numa linha de montage,. A aplicação permitirá monitorizar o estado de cada produto, verificar a incorporação correta de materiais e garantir que o trabalho seja realizado com qualidade. Com isto, temos uma redução de risco de produtos defeituosos ou incompletos chegarem aos clientes.
    

=== Objetivos

- *Aumentar o lucro:*
    
    A finalidade da gestão da linha de montagem é melhorar a eficácia operacional, o que levará a uma montagem mais rápida e à diminuição de desperdícios. Um procedimento mais eficaz possibilita a produção de mais itens em menos tempo, elevando a capacidade de fornecimento e, consequentemente, os lucros.
    
- *Melhorar a eficiência de trabalho:*
    
    A gestão mais precisa de tarefas e recursos é viabilizada pela centralização da informação e pelo acompanhamento em tempo real do processo de montagem. A ferramenta pode auxiliar na deteção de entraves de montagem e na realocação eficiente de tarefas, assegurando o foco contínuo dos funcionários nas suas atividades, melhorando a eficiência da organização.
    
- *Otimizar a atribuição de recursos e materiais:*
    
    A aplicação também tenciona otimizar o uso de recursos, como materiais e mão de obra, distribuindo-os de forma inteligente ao longo da linha de montagem. É possível garantir que não há falta de peças em nenhum ponto do processo, evitando atrasos e desperdícios, pois teremos uma visão clara das etapas que estão a decorrer no momento.
    
- *Melhorar o acompanhamento do produto:*
    
    Um objetivo importante é permitir o acompanhamento completo do produto. A aplicação dará visibilidade sobre cada peça do mobiliário e a etapa exata em que este se encontra na linha de montagem, garantindo uma transparência total sobre o estado de cada encomenda. Isto permitirá uma resposta mais rápida e precisa a pedidos de informação dos clientes.
    
- *Melhorar a experiência do cliente com prazos mais precisos:*
    
    A empresa poderá oferecer aos clientes prazos de entrega mais precisos e confiáveis através da utilização da aplicação. Ao melhorar a precisão da visualização do progresso da encomenda pelos clientes, aumentar-se-á a confiança e satisfação dos mesmos perante Valhala.

== Justificação e utilidade do sistema

=== Justificação do Sistema:

A empresa Valhala necessita desta aplicação para uma gestão mais eficiente das encomendas e do processo de montagem de mobiliário, além da centralização do _stock_ da empresa num único sistema acessível tanto para os clientes bem como para a empresa. A falta de acompanhamento detalhado do processo de montagem gera ansiedade aos clientes sobre o estado da sua encomenda, criando um aumento nas comunicações.

Para além disso, a gestão manual de _stock_ dificulta a manutenção de níveis de inventário, podendo haver atrasos nas encomendas. Assim, havendo centralização de informação num único sistema digital, é possível otimizar a gestão de recursos, aumentar a eficiência da empresa, devido à redução de erros.

Assim, este sistema justifica-se pela necessidade de uma plataforma que permita acompanhar cada etapa do processo do mobiliário de forma clara para o cliente, bem como centralizar o controlo de _stock_ da empresa, garantindo uma operação mais organizada e eficiente.

=== Utilidade do Sistema:

O site desenvolvido terá diversas utilidades práticas, tanto para o cliente, como para Valhala.

Primeiramente, o sistema permitirá que o cliente acompanhe todo o processo, desde a confirmação da encomenda até à sua entrega, ou seja, poderá ver claramente em que fase é que se encontra o seu pedido, aumentando a confiança e satisfação para com o serviço. Com isto, haverá uma diminuição da necessidade de comunicações constantes entre a empresa e os clientes para obter atualizações.

Por outro lado, o sistema também irá suportar a gestão de _stock_ atualizado em tempo real. Esta centralização de _stock_ também permitirá uma melhor previsão de necessidades de reposição, reduzindo desperdícios e garantindo que os materiais serão rapidamente repostos para novas encomendas.

Por fim, este projeto apresenta uma solução customizada para as necessidades específicas da empresa Valhala. Este site estará adaptado para oferecer um acompanhamento visual e transparente do processo de montagem de mobiliário, sendo algo inovador no setor. Além disso, a possibilidade de integrar a gestão de encomendas com a gestão de _stock_ num único local virtual é uma grande vantagem, pois permite a otimização tanto a nível operacional como no atendimento ao cliente.


== Estabelecimento da identidade do projeto

O projeto Valhala foi desenvolvido para corresponder às necessidades de gestão e acompanhamento da linha de montagem e operações relacionadas à produção de mobiliário. Este inclui funcionalidades que abrangem desdo controlo de _stock_ até ao acompanhamento detalhado do processo e interação com os clientes. A tabela seguinte apresenta os principais atributos que definem a identidade do projeto:

#figure(
  caption: "Identidade do projeto",
  kind: table,
  table(
    columns: 2 * (1fr,), 
    stroke: (dash: "densely-dotted", thickness: 0.75pt), 
    fill: (x, y) => if y == 0 { blue.lighten(70%) },
    [*Atributo*], [Descrição],
    [*Nome*], [Valhala],
    [*Categoria*], [Plataforma de gestão de montagem de mobiliário],
    [*Idiomas disponíveis*], [Português],
    [*Faixa etária*], [+16],
    [*Propósito*], [Acompanhamento de montagem de mobiliário],
    [*Acrónimos*], [Valhala, VHL],
    [*Tempo de execução*], [4 meses],
    [*Desenvolvedores*], [Afonso Dionísio, João Lobo, Mariana Rocha, Rita Camacho],
    [*Logótipo*], [
#figure(
  caption: "Logótipo da empresa",
  kind: image,
  image("images/logo_valhala.png", width: 30%)
)],
  )
)

== Identificação dos recursos necessários

De forma a planear e desenvolver o sistema de gestão pretendido de forma eficaz, é crucial mobilizar uma equipa de profissionais qualificados e especializados, assim como dispor dos recursos materiais adequados. Estes recursos são essenciais para garantir o sucesso da implementação do sistema.

*Recursos humanos:*

A *equipa de desenvolvimento* altamente qualificada será responsável pela realização do *_software_* a ser implementado. Será também estabelecido contacto direto com os *profissionais da empresa* de forma a perceber e estudar o funcionamento da mesma, garantindo que a solução atende a todas as suas necessidades. Será também fundamental a colaboração de *especialistas em produção e logística* para garantir que o *_software_* otimiza corretamente a gestão de stock e linha de montagem.

*Recursos de hardware:*

Será necessário garantir uma infraestrutura tecnológica robusta para suportar o sistema de gestão e o seu desenvolvimento. Neste sentido, os seguintes recursos de hardware serão essenciais:

- *Servidores*: dois servidores principais, um para hospedar o sistema de base de dados e outro para a aplicação, garantindo um desempenho otimizado e a segurança necessária para armazenar e processar grandes volumes de informação.
- *Computadores de desenvolvimento*: a equipa de desenvolvimento irá utilizar máquinas dedicadas com capacidade de processamento suficiente para realizar as tarefas de programação, testes e implementação do sistema.

*Recursos de _software_:*

O sucesso do desenvolvimento do _software_ depende de ferramentas específicas que possibilitem a modelação, o desenvolvimento e a gestão eficiente de dados e processos. Entre os principais recursos de _software_ destacam-se:

- *Visual Paradigm*: ferramenta para a modelação da aplicação a ser desenvolvida.
- *Microsoft SQL Server*: base de dados escolhida para armazenar a informação gerida pela solução.
- *Figma*: ferramenta cooperativa de design utilizada para a criação dos _mockups_.
- *.NET Blazor*: plataforma de desenvolvimento de aplicações *web* escolhida para a criação da interface do utilizador e do *back-end* da aplicação. Esta plataforma usa *C\#* e *HTML*.
- *Git*: *_software_* de controlo de versões de código utilizado para garantir o trabalho colaborativo entre os desenvolvedores.

A combinação dos recursos humanos especializados, uma infraestrutura tecnológica adequada, e as ferramentas de _software_ e gestão mencionadas irá permitir o desenvolvimento de um sistema robusto e eficiente enquadrado no contexto da empresa.

== Maqueta do sistema

A maqueta do sistema proporciona uma visão geral e simplificada da arquitetura funcional e dos componentes principais do sistema deste projeto para a empresa Valhala. Esta descreve os diferentes elementos do sistema, como a camada de apresentação, interface do utilizador, lógica de negócio e a base de dados, interagindo entre si para garantir a eficiência e eficácia do processo. Este diagrama atua como um ponto inicial para o desenvolvimento de _software_, ilustrando as interações entre os utilizadores — clientes, funcionários e fornecedores — e o sistema a ser desenvolvido. 

#figure(
  caption: "Maqueta do sistema",
  kind: image,
  image("images/maqueta.png", width: 45%)
)

=== Base de Dados

O sistema de *base de dados* é responsável por armazenar várias informações essenciais: o estado das encomendas, as peças utilizadas em cada uma, e o _stock_ disponível de peças. Além disso, também serão registadas os manuais de instruções destinadas aos funcionários para a construção dos produtos.

=== Lógica de negócio

A *lógica de negócio* determina como a informação deve ser criada, armazenada e alterada através das regras e métodos reais aplicados no funcionamento da empresa. Esta camada inclui a validação de dados, cálculos complexos e a orquestração dos processos que afetam diretamente os resultados e decisões apresentadas ao utilizador.

=== Camada de apresentação

A *camada de apresentação* é responsável por processar e organizar as informações que são apresentadas ao utilizador. Esta atua como uma ponte entre o utilizador e a lógica de negócio do sistema, garantindo que todos os dados relevantes sejam exibidos de forma clara e acessível. Além disso, transforma a complexidade dos processos realizados na lógica de negócio em interfaces visuais que tornam a navegação e interação mais fáceis, garantindo uma experiência para o utilizador intuitiva.

=== Interface do Utilizador

A *Interface do utilizador* permite transmitir, de forma clara e simples, mas também apelativa, o objetivo e utilidade do produto desenvolvido, e incentivar a que o mesmo seja “consumido”. Para além disso, estabelece uma conexão com as camadas inferiores e revela ao utilizador toda a informação de forma organizada e visualmente chamativa. Esta tem de ser capaz de acolher confortavelmente o utilizador, sendo fácil para o mesmo navegar na plataforma, não causando constrangimentos na sua utilização.

Assim, serão desenvolvidas quatro interfaces distintas, cada uma para corresponder às necessidades específicas dos diferentes utilizadores:

- *Cliente*: Permite ao cliente ver os produtos disponíveis, seguir o progresso das encomendas e observar a montagem dos produtos comprados.

- *Gestor*: Adiciona funcionalidades de gestão, como controlar o catálogo de produtos, registar e eliminar fornecedores e funcionários, e ver em detalhe os procedimentos de produção.

- *Funcionário*: Concentrado na encomendas e na linha de montagem, possibilitando um controlo minucioso de todas as fases de produção.

- *Fornecedor*: Permite ao fornecedor ver os pedidos de reposição de peças e modificar o estado do _stock_ disponível.


=== Sistema

O *sistema* é a estrutura central que interliga todos os tópicos referidos anteriormente — desde a *camada de apresentação* até à *base de dados*, passando pela *lógica de negócio* e pela *interface do utilizador*. Este sistema permite a comunicação entre os diferentes elementos proporcionando uma experiência consistente e confiável para todos os utilizadores.

=== Utilizadores

Os *utilizadores* do sistema incluem quatro grupos principais: *clientes*, *funcionários*, *gestores* e *fornecedores*. Os clientes podem acompanhar o estado das suas encomendas e a progressão da montagem do mobiliário. Os funcionários utilizam o sistema para monitorizar o progresso das montagens e gerir o stock disponível. Os fornecedores acedem à interface para consultar pedidos de reposição de stock dos materiais. Os gestores têm acesso a funcionalidades administrativas, como a gestão do catálogo de produtos, o registo e remoção de fornecedores e funcionários e supervisão dos processos de produção.
Cada grupo de utilizadores interage com o sistema de forma distinta, através de interfaces personalizadas que se adequam às suas necessidades.

== Definição de um conjunto de medidas de sucesso

Considera-se que a implementação de uma plataforma de gestão de encomendas e da linha de montagem terá um impacto significativo e positivo na eficiência e sustentabilidade da empresa. Ao centralizar toda a informação relacionada com os processos de construção de uma encomenda, é esperada uma *redução de 30% a 50% no número de erros durante a produção*. Esta diminuição de falhas permitirá uma utilização mais eficiente de materiais e utensílios, evitando o desperdício dos mesmos, promovendo uma operação mais sustentável, com uma *redução de desperdício em cerca de 40%*.

Além disso, ao eliminar erros na construção das encomendas, o tempo que cada uma demorará em produção será reduzido, o que permitirá que as *entregas sejam realizadas até 20% mais rapidamente* do que o habitual. Este fator deverá *reduzir o número de encomendas extraviadas em cerca de 17%*, e também contribuir para uma *diminuição de 60% a 70% no volume de solicitações ao atendimento ao cliente*, dado que os próprios clientes terão mais visibilidade sobre o processo.

Em consequência de todas estas melhorias, espera-se um *aumento da satisfação dos clientes em cerca de 70%*, dado que terão mais confiança em todo o processo de entrega, graças ao aumento da transparência. Internamente, *a eficiência da empresa deverá crescer em cerca de 50% a 60%*, o que se refletirá num *aumento dos lucros que poderá chegar a 35%*. Esta solução não só otimizará os processos como também reforçará o compromisso da empresa com a sustentabilidade e a qualidade do serviço prestado aos seus clientes.

== Plano de desenvolvimento (diagrama GANTT)

Para garantir uma implementação bem-sucedida do sistema de gestão de linha de montagem de mobiliário, o Sr. Odin, juntamente com a administração e com a equipa de engenheiros, elaborou um plano de trabalho abrangente, representado pelo seguinte detalhado Diagrama de GANTT.

Iniciámos com a *definição do sistema*, onde o trabalho foi organizado em etapas essenciais, como a contextualização do projeto, a justificação da sua necessidade e a definição clara dos seus objetivos. Também foram identificados os recursos necessários para o desenvolvimento deste projeto e foi criado um esboço do sistema.

A *fase de levantamento e análise de requisitos* envolve a recolha de informações sobre as necessidades da empresa e dos clientes. Durante este processo, os requisitos funcionais e não funcionais serão organizados e validados, assegurando que o sistema seja capaz de cumprir as expectativas.

Na *especificação e modelação do _software_*, iremos focar-nos na criação de diagramas que descrevem a estrutura do sistema, bem como os seus comportamentos. O trabalho será dividido pelos desenvolvedores, permitindo explorar os *casos de uso* e avançar no desenvolvimento.

Na *conceção do sistema de dados*, terá definido o modelo lógico da base de dados, incluindo as tabelas, as entidades e os relacionamentos. Esta estrutura assegura que o sistema irá suportar de forma eficiente todas as funcionalidades propostas.

Por fim, temos as *interfaces do sistema*, onde estarão esboços que ilustram as diversas vistas e aparência esperada do site. Este trabalho irá garantir uma organização intuitiva dos ecrãs, facilitando a utilização do sistema por clientes e funcionários.

Este processo cuidadosamente planeado assegura uma abordagem sistemática e eficiente para o desenvolvimento do sistema, garantindo que cada fase seja cumprida de forma precisa e no tempo adequado, permitindo o acompanhamento do progresso do projeto e a entrega de um sistema que vá de encontro aos objetivos estabelecidos pela empresa Valhala.

#figure(
  caption: "Diagrama de GANTT",
  kind: image,
  image("images/Gantt.png", width: 72%)
)

= Definição dos Requisitos

== Apresentação da estratégia e método

No desenvolvimento deste projeto para a empresa Valhala, realizou-se uma abordagem estruturada para o levantamento de requisitos. Tendo em conta a necessidade de garantir que o sistema corresponde às exigências dos diversos grupos que irão utilizar o _website_, começámos por uma fase de investigação detalhada sobre o funcionamento interno da empresa e sobre o seu processo de linha de montagem. Este processo incluiu entrevistas com perguntas pré-definidas, ajustadas consoante o papel que desempenha na empresa.

1. *Reuniões:*

1.1. Realizámos diversas reuniões com o Sr. Odin, CEO da empresa, para compreender os objetivos gerais do sistema.

1.2. Entrevistámos os funcionários responsáveis pela gestão da linha de montagem para obter uma visão clara deste processo, bem como os funcionários responsáveis pela gestão de _stock_, de modo a definir a estratégia mais eficiente para otimizar os pedidos de reposição junto dos fornecedores.

1.3. Foram também realizadas reuniões com os fornecedores para entender as suas expectativas em termos de reposição de _stock_.

1. *Observação dos Processos:*

Observámos o funcionamento da linha de montagem para identificar oportunidades onde o sistema possa apoiar e simplificar as operações sem alterar os processos existentes, de modo a facilitar as suas operações diárias.

1. *Análise de Documentação:*

Investigámos a documentação interna necessária da empresa, incluindo os processos atuais de encomenda, montagem dos produtos, para identificar como é que estes processos estão a ser realizados. Além disso, também analisámos relatórios sobre o _stock_ e registos de interação com os fornecedores para garantir que o sistema vai de encontro com as necessidades de reposição e controlo de _stock_ já existente.

1. *Questionários:*

Realizámos questionários direcionados aos funcionários, gestores, clientes e fornecedores para recolher informações detalhadas sobre as preferências e expectativas de cada grupo em relação ao sistema a ser desenvolvido, permitindo compreender melhor as suas necessidades específicas.

Para os funcionários, procurámos analisar as suas necessidades em termos de organização das tarefas de montagem. No que diz respeito à gestão de _stock_, identificámos que essa função está diretamente ligada aos gestores, pois estes são responsáveis por supervisionar a disponibilidade das peças.

Os clientes responderam a perguntas sobre o acompanhamento de encomendas e a facilidade de acesso às informações das suas encomendas.

Por fim, os fornecedores responderam a questões sobre o processo de reposição de _stock_ e eficiência de comunicação com a empresa.

As informações recolhidas destes inquéritos foram essenciais para moldar as funcionalidades do sistema, de forma a garantir que este seja intuitivo e que satisfaça todos os utilizadores envolvidos.

Através desta abordagem, assegurámos que todas as necessidades foram consideradas, permitindo planear um sistema que otimizará o processo de montragem e melhorar a comunicação e eficiência da empresa.

== Descrição geral

A definição dos requisitos foi realizada com o objetivo de capturar de forma precisa as necessidades e expectativas dos utilizadores do sistema. Durante este processo, detalhámos a origem de cada requisito, ligando-os diretamente às interações esperadas com o sistema. Além disso, avaliámos a relevância de cada requisito para a aplicação, garantindo que todos contribuam para os objetivos.

Os requisitos *funcionais* foram organizados em duas categorias principais: Requisitos do Utilizador, que descrevem as funcionalidades esperadas em linguagem natural e acessível, e Especificação do Sistema, que traduzem o que o sistema deve ser capaz de fazer para que o requisito do utilizador seja satisfeito.

Os requisitos *não* *funcionais* são aspetos cruciais que determinam a qualidade e o desempenho de um sistema de *_software_*, indo além das funcionalidades básicas. Estas exigências desempenham um papel fundamental na satisfação do utilizador e no êxito global do projeto, abrangendo aspetos como segurança, desempenho e usabilidade.

== Levantamento

No processo de desenvolvimento do sistema de gestão da empresa, está a ser realizado um levantamento detalhado dos requisitos, seguido pela organização e validação destes por áreas de trabalho, garantindo que cada vista do sistema corresponde às necessidades específicas de cada grupo de utilizadores.

Nesta fase crítica, foram identificadas quatro áreas principais que desempenham papéis fundamentais para o funcionamento do sistema:

- *Clientes:* Esta área do sistema permite que os clientes realizem encomendas de produtos de forma eficiente, acompanhando o seu progresso a cada etapa.
- *Funcionários:* Focada na operação diária de produção, esta área apoia os funcionários no fabrico dos produtos, oferecendo um controlo detalhado sobre as tarefas de montagem e acesso rápido a informações importantes, como peças necessárias.
- *Fornecedores:* Esta área facilita o controlo sobre o *_stock_* de materiais essenciais ao fabrico, permitindo a criação de pedidos de reabastecimento e a verificação da disponibilidade de itens críticos para manter a linha de produção sem interrupções.
- *Gestores:* A área de gestores fornece uma visão abrangente das operações da empresa, desde a monitorização da linha de produção até à gestão de encomendas.

Durante o processo de levantamento de requisitos, o CEO, Sr. Odin, e a Sra. Acácia participaram em várias reuniões junto dos analistas da equipa de desenvolvimento. Nessas reuniões, cada área foi discutida em detalhe, com especial foco nas operações essenciais para o funcionamento da empresa.

Além das reuniões, a equipa de analistas realizou um estudo dos documentos internos e observou as operações diárias, obtendo uma compreensão mais profunda dos fluxos de trabalho. Essa observação permitiu identificar oportunidades de melhoria e adaptar os requisitos às necessidades específicas da Valhala.

À medida que o levantamento de requisitos avança, todos os dados são cuidadosamente documentados, garantindo que todas as necessidades da Valhala sejam consideradas e integradas na solução final, promovendo a eficiência operacional e a satisfação de todos os utilizadores do sistema.

== Análise

=== Requisitos Funcionais:

Os requisitos funcionais a seguir descrevem as funcionalidades específicas que devem ser implementadas no projeto. Cada requisito inclui uma explicação sobre a sua importância no contexto do sistema, justificando o seu propósito. Estes requisitos especificam tanto o que o utilizador deve conseguir fazer ao interagir com o sistema quanto as funcionalidades internas que o sistema deve cumprir para garantir essas ações.

==== Verificação de _stock_ de peças

Este requisito foi identificado durante uma reunião com os fornecedores e alguns funcionários.

*Relevância para a aplicação:*

Para garantir a continuidade e eficiência da produção, é essencial que os funcionários possam consultar o _stock_ das peças em tempo real e, quando necessário, solicitar reposição das peças aos fornecedores. Isto permite uma rápida reposição de materiais e facilita o planeamento logístico e de produção, prevenindo interrupções e minimizando desperdícios.

*Definição dos requisitos do utilizador:*

1.1. Os funcionários devem estar autenticados para consultar o _stock_ de materiais.

1.2. Os fornecedores apenas poderão ver o _stock_ específico das peças que foram solicitados para reposição.

*Especificação dos requisitos do sistema:*

1.1.1. O sistema deve solicitar o início de sessão ao funcionário, com o seu identificador único e palavra passe, para que possam consultar o _stock_ de peças.

1.1.2. O sistema deve exibir a quantidade atual de cada peça disponível em tempo real para os funcionários autenticados.

1.1.3. O sistema deve garantir que cada peça tem um identificador único.

1.2.1. O sistema deve permitir que os fornecedores autenticados visualizem apenas as peças cuja reposição foi solicitada.

1.2.2. O sistema deve garantir que os fornecedores não tenham acesso ao _stock_ completo, de modo que a visualização das peças requisitadas pelos funcionários seja limitado.

==== Registo do processo de montagem

Este requisito foi identificado durante uma reunião com alguns funcionários.

*Relevância para a aplicação:*

Para acompanhar o progresso das operações e garantir a eficiência no processo de montagem, é crucial que os funcionários possam registar o processo de cada fase. Este acompanhamento em tempo real permite que a empresa tenha visibilidade do estado da produção, podendo identificar eventuais atrasos e otimizar recursos e gestão de tempo.

*Definição dos requisitos do utilizador:*

2. Os funcionários devem poder registar o progresso de cada fase do processo de montagem no sistema.

*Especificação dos requisitos do sistema:*

2.1. O sistema deve permitir que os funcionários autenticados atualizem o estado de cada fase da montagem.


==== Visualização do processo de montagem

Este requisito foi identificado durante uma reunião com o Sr. Odin e através da observação do funcionamento da linha de montagem.

*Relevância para a aplicação:*

Para aumentar a transparência e melhorar a experiência dos clientes e a eficiência dos funcionários, os sistema deve permitir a visualização do processo de montagem dos pedidos em tempo real. Esse acompanhamento ajuda a manter os clientes informados sobre o estado das suas encomendas e permite que os funcionários organizem e acompanhem cada etapa do processo.

*Definição dos requisitos do utilizador:*

3.1. Os clientes autenticados devem poder visualizar o progresso de montagem dos seus próprios pedidos.

3.2. Os funcionários autenticados devem poder visualizar o progresso de montagem de todos os pedidos.

*Especificação dos requisitos do sistema:*

3.1.1. O sistema deve permitir que os clientes autenticados visualizem o progresso de montagem apenas dos seus próprios pedidos.

3.2.1. O sistema deve permitir que os funcionários autenticados visualizem o progresso de montagem de todos os pedidos.

3.3. O sistema deve exibir cada fase do processo de montagem.

==== Gestão do catálogo de produtos

Este requisito foi identificado durante uma reunião com o Sr. Odin.

*Relevância para a aplicação:*

A gestão de produtos é essencial para que o catálogo da empresa esteja sempre atualizado, permitindo a adição e remoção de produtos com as informações adequadas.

*Definição dos requisitos do utilizador:*

4.1. O gestor deverá poder adicionar produtos no catálogo da empresa.

4.2. O gestor deverá poder remover produtos no catálogo da empresa.

*Especificação dos requisitos do sistema:*

4.1.1. O sistema deve permitir que o gestor adicione produtos com descrição detalhada, incluindo nome, preço, peças constituintes, imagem (opcional) e processo de montagem.

4.1.2. O sistema valida se todos os campos obrigatórios estão preenchidos antes de permitir a adição do novo produto.

4.2.1. O sistema deve permitir que o gestor remova produtos que já não se encontrem disponíveis para venda e produção.

==== Autenticação com o Sistema Externo de Compras

Este requisito foi identificado durante uma reunião com o Sr. Odin.

*Relevância para a aplicação:*

Esta funcionalidade garante a integração com o sistema externo de compras, facilitando a experiência do cliente ao não exigir um novo registo.

*Definição dos requisitos do utilizador:*

1. O cliente deverá iniciar sessão com as credenciais existentes do sistema externo de compras.

*Especificação dos requisitos do sistema:*

5.1. O sistema deve permitir que o cliente insira o seu identificador único (ID) e senha definidos no sistema externo de compras da empresa.

5.2. O sistema verifica se os dados inseridos pelo cliente estão corretos.


==== Regras de Senha

Este requisito foi identificado durante uma reunião com o Sr. Odin.

*Relevância para a aplicação:*

Manter a mesma regra de complexidade de senha que o sistema externo garante consistência, além de assegurar uma camada extra de segurança.

*Definição dos requisitos do utilizador:*

1. Ao autenticar-se pela primeira vez, o utilizador deve criar uma senha seguindo as regras de complexidade definidas pelo sistema.

*Especificação dos requisitos do sistema:*

6.1. O sistema deve exigir que a senha do utilizador contenha no mínimo 8 caracteres.

6.2. O sistema deve exigir que a senha contenha pelo menos uma letra maiúscula, uma letra minúscula, um número e um caractere especial.

6.3. O sistema valida a senha, caso esta cumpra com os requisitos definidos.

==== Visualização do Catálogo

Este requisito foi identificado durante uma reunião com o Sr. Odin.

*Relevância para a aplicação:*

Permitir a visualização do catálogo sem a necessidade de ter sessão iniciada torna a experiência mais acessível e prática para potenciais clientes.

*Definição dos requisitos do utilizador:*

1. O cliente deve poder ver o catálogo de produtos da empresa sem a necessidade de iniciar sessão.

*Especificação dos requisitos do sistema:*

7.1. O sistema deve permitir que o catálogo de produtos seja visualizado por qualquer utilizador, independentemente de ter iniciado sessão ou não.

7.2. O sistema apresenta uma lista de produtos com informações relevantes, como nome, preço, materiais, imagens e processo de montagem.

==== Visualização das encomendas

Este requisito foi identificado através de análise de documentação.

*Relevância para a aplicação:*
 É importante para o cliente conseguir consultar as suas encomendas, tanto as já concluídas como as que ainda estão a ser realizadas. Assim, estas devem ser apresentadas para que o cliente possa averiguar em que estado as mesmas se encontram.
Da mesma forma, a equipa de funcionários deve ser capaz de visualizar todas as encomendas e os seus respetivos estados, possibilitando uma melhor gestão e controlo das atividades de montagem, envio e entrega, o que contribui para um serviço mais eficiente e preciso.

*Definição de requisito do utilizador:*
8.1.  O cliente deve ser capaz de acompanhar a(s) sua(s) encomenda(s).
8.2. Os funcionários devem ser capazes de ver todas as encomendas e os seus estados.

*Especificações dos requisitos do sistema:*
8.1.1.  O sistema deve apresentar uma secção “Encomendas”, onde permite ao cliente visualizar todas as suas encomendas.

8.1.2.  O sistema deve disponibilizar uma subsecção “Encomendas”, onde constam todas as encomendas do cliente, permitindo fácil consulta.
8.1.3.  Cada encomenda deve apresentar o seu identificador, o produto encomendado, o estado atual, e a data em que foi entregue, quando aplicável.
8.1.4.  Cada encomenda listada deve exibir claramente o estado atual da mesma, “Em processamento”, “Em montagem”, ”Concluído”.
8.1.5.  Para encomendas em fase de montagem, o sistema deve permitir ao cliente visualizar o estado atual da montagem do produto.

==== Encomendas de peças

Este requisito foi identificado durante uma reunião com os fornecedores e através da observação do funcionamento da linha de montagem.

*Relevância para a aplicação:*

Esta funcionalidade permite ao gestor efetuar encomendas de _stock_ diretamente aos fornecedores, garantindo a reposição de peças e evitando rupturas de _stock_.

*Definição dos requisitos do utilizador:*

9. O gestor deve ser capaz de fazer encomendas de _stock_ para reposição diretamente aos fornecedores da empresa.

*Especificação dos requisitos do sistema:*

9.1. O sistema deve permitir que o gestor selecione as peças e quantidades a encomendar.

9.2. O sistema deve gerar uma confirmação da encomenda com os detalhes do pedido antes de finalizar o processo.

9.3. O sistema deve enviar a encomenda ao fornecedor, registando a data e os itens encomendados para consulta futura.

==== Gestão de Encomendas pelo Fornecedor

Este requisito foi identificado durante uma reunião com os fornecedores.

*Relevância para a aplicação:*

Esta funcionalidade facilita a comunicação entre a empresa e os fornecedores, permitindo que estes acompanhem e atualizem o estado das encomendas, o que melhora a eficiência no processo de reposição de _stock_ de peças.

*Definição dos requisitos do utilizador:*

10.1. O fornecedor deve poder visualizar as encomendas de peças recebidas da empresa.

10.2. O fornecedor deve poder atualizar o estado de cada encomenda conforme o progresso do pedido.

*Especificação dos requisitos do sistema:*

10.1.1. O sistema deve permitir que o fornecedor acesse a uma lista de encomendas de peças realizadas pela empresa.

10.1.2. O sistema deve exibir detalhes relevantes de cada encomenda, como data de emissão, peça, quantidade e o estado atual.

10.2.1 O sistema deve permitir que o fornecedor atualize o estado da encomenda, com opções como "Em processamento," "Despachada," e "Entregue.”

==== Atualização Manual de _Stock_

Este requisito foi identificado durante uma reunião com os alguns funcionários da empresa e através da observação do funcionamento da linha de montagem.

*Relevância para a aplicação:*

Permitir que os funcionários realizem ajustes manuais no _stock_ é essencial para manter a precisão dos inventários, corrigindo eventuais discrepâncias e adaptando-se a situações inesperadas.

*Definição dos requisitos do utilizador:*

11. Os funcionários devem poder ajustar manualmente o _stock_ de peças em situações que exijam correções ou ajustes.

*Especificação dos requisitos do sistema:*

11.1. O sistema deve permitir que o funcionário acesse a uma lista de peças.

11.2. O sistema deve permitir que o funcionário selecione peças e modifique as suas quantidades em _stock_.

==== Registo e atualização de peças pelo Fornecedor

Este requisito foi identificado durante uma reunião com alguns fornecedores.

*Relevância para a aplicação:*

Esta funcionalidade permite que os fornecedores mantenham atualizado o catálogo de peças disponíveis para a empresa, garantindo que as informações sobre disponibilidade e especificações de peças estejam sempre corretas.

*Definição dos requisitos do utilizador:*

12. Os fornecedores devem poder adicionar e descontinuar peças que fornecem à empresa.

*Especificação dos requisitos do sistema:*

12.1. O sistema deve incluir uma funcionalidade para que os fornecedores descontinuem peças, removendo-as do catálogo disponível para compra pela empresa.

12.2 O sistema deve permitir que os fornecedores registem novas peças, inserindo o seu código de identificação e produto a que estão associadas.

==== Registo na aplicação dos Novos Fornecedores e Funcionários

Este requisito foi identificado durante uma reunião com o Sr. Odin.

*Relevância para a aplicação:*

É importante para a aplicação que se conheça quem vai interagir com as encomendas, de forma a garantir que apenas têm acesso os utilizadores autorizados, assim como são limitadas as informações a que podem aceder dependendo do tipo de utilizador. Assim, é importante recolher, confirmar e guardar as informações de quem utiliza a aplicação para que antes de realizarem qualquer ação se possam autenticar.

*Definição dos requisitos do utilizador:*

13. O gestor deverá registar os fornecedores e os funcionários.

*Especificação dos requisitos do sistema:*

13.1 O sistema pede ao gestor o nome, ID único e palavra-passe do fornecedor ou trabalhador que pretende registar.

13.2 O sistema armazena os dados do fornecedor ou trabalhador.

==== Remoção na aplicação dos antigos Fornecedores e Funcionários

Este requisito foi identificado durante uma reunião com o Sr. Odin.

*Relevância para a aplicação:*

É importante para a aplicação que se elimine dados desatualizados, especialmente utilizadores que já não pertencem mais à equipa. Assim, é importante removê-los da aplicação.

*Definição dos requisitos do utilizador:*

14. O gestor deverá eliminar os registos de fornecedores e funcionários desatualizados.

*Especificação dos requisitos do sistema:*

14.1 O sistema pede ao gestor o ID único e password do fornecedor ou trabalhador que pretende remover.

14.2 O sistema elimina os dados do ex-fornecedor ou ex-trabalhador.

==== Visualizar produto

Este requisito foi identificado através das informações recolhidas dos inquéritos aos utilizadores do sistema.

*Relevância para a aplicação:*

É do interesse do gestor, assim como do cliente, fornecedor e trabalhador, poder visualizar um produto, apesar das diferentes razões.

*Definição dos requisitos do utilizador:*

15. O gestor, o cliente, o fornecedor e o trabalhador devem ser capazes de visualizar as informações mais relevantes de um dado produto.

*Especificação dos requisitos do sistema:*

15.1 O sistema deve apresentar uma secção “Catálogo” que permita o acesso à lista de produtos.

15.2 Para cada produto o sistema deve apresentar toda a informação relevante à mesma, como o seu nome, descrição, preço, número de vezes encomendado, peças constituintes e as suas etapas de produção.

==== Ordenar catálogo

Este requisito foi identificado através das informações recolhidas dos inquéritos efetuados aos clientes.

*Relevância para a aplicação:*

Na situação onde há vários produtos disponibilizados no catálogo, é fundamental que o gestor, cliente, fornecedor e trabalhador possam organizar os produtos como mais lhes interessa. Assim, é essencial existir a possibilidade de ordenar o catálogo de acordo com certas preferências.

*Definição dos requisitos do utilizador:*

16. O gestor, o cliente, o fornecedor e o trabalhador devem ser capazes de ordenar o catálogo pela sua preferência: popularidade, preço ascendente/descente ou alfabeticamente.

*Especificação dos requisitos do sistema:*

16.1 O sistema deve apresentar o catálogo de acordo com a ordem de preferência selecionada.

==== Iniciar Sessão

Este requisito foi identificado durante uma reunião com o Sr. Odin.

*Relevância para a aplicação:*

Para aceder à aplicação Valhala, é necessário que um utilizador previamente registado faça a autenticação com as suas credenciais, permitindo assim associar o utilizador atual da aplicação com um dos registos efetuados. Ao permitir identificar o utilizador, a autenticação vai dar‐lhe acesso às informações que lhe são relevantes, dependendo do tipo de utilizador: gestor, cliente, fornecedor e trabalhador.

*Definição dos requisitos do utilizador:*

17. O gestor, cliente, fornecedor e trabalhador têm de iniciar sessão, através do seu ID único e palavra‐chave, para usufruir da aplicação.

*Especificação dos requisitos do sistema:*

17.1 O sistema pede ao utilizador o ID único e palavra-passe.

17.2 O sistema verifica se os dados inseridos são válidos.

==== Terminar Sessão

Este requisito foi identificado durante uma reunião com o Sr. Odin.

*Relevância para a aplicação:*

O sistema deve permitir que o gestor, cliente, fornecedor e trabalhador terminem a sua sessão quando desejarem, o que é muito útil quando se acede à aplicação em dispositivos a que outras pessoas têm acesso para que mais ninguém possa usar a aplicação. Isto funciona como medida de segurança para os utilizadores e é de extrema importância já que a aplicação tem várias informações pessoais do utilizador guardadas, como detalhes de encomendas realizadas, devendo‐se por isso evitar que outras pessoas a utilizem.

*Definição dos requisitos do utilizador:*

18. O gestor, cliente, fornecedor e trabalhador devem ser capazes de terminar a sua sessão na aplicação.

*Especificação dos requisitos do sistema:*

18.1 O sistema deve terminar a sessão do utilizador na aplicação.


=== Requisitos Não Funcionais:

Os requisitos não funcionais tratam das características que definem o comportamento do sistema e influenciam a sua confiabilidade, segurança e desempenho. Estes aspetos são essenciais para que o sistema entregue uma experiência de uso de alta qualidade e para que suporte de forma eficaz as operações da empresa.

- Requisitos de Produto:
    - O sistema deverá garantir que as páginas sejam carregadas em no máximo 5 segundos em condições normais de rede.
    - O sistema deve ser intuitivo e de fácil utilização.
    - O sistema deve ser capaz de suportar inúmeros clientes em simultâneo.
    - O sistema deverá ser responsivo, adaptando-se a diferentes dispositivos como smartphones, tablets e desktops.
- Requisitos Organizacionais:
    - O sistema precisará de realizar backups automáticos diários dos dados, com a capacidade de restaurar os dados até 7 dias anteriores.
    - O sistema deverá estar preparado para ser atualizado sem necessidade de longos períodos de inatividade.
    - O sistema tem um período definido entre as 3 am e as 5 am da manhã para entrar em  estado de manutenção.
- Requisitos Externos:
    - O sistema terá de ser compatível, pelo menos, com os navegadores mais utilizados: Google Chrome, Safari, Microsoft Edge e Firefox.
    - O sistema deverá ser compatível com as normas de proteção de dados pessoais (GDPR).
- Requisitos de Desenvolvimento:
    - O sistema deverá ser entregue com a documentação básica do código-fonte, de modo a facilitar o processo de manutenção e futuras alterações.

== Organização

Nós, desenvolvedores, organizamos os requisitos em duas categorias principais:

1. *Requisitos Funcionais*: Estes requisitos descrevem o que o sistema deve fazer, ou seja, as interações entre o sistema e o seu ambiente. Eles tratam do comportamento funcional do sistema, como as funcionalidades e os serviços que o mesmo deve oferecer.
2. *Requisitos Não Funcionais*: Estes requisitos dizem respeito a como o sistema deve realizar as suas funções. Eles abordam aspetos que não estão diretamente ligados ao comportamento funcional, mas que são essenciais para o desempenho global do sistema, como performance, portabilidade, entre outros.

Dentro dos requisitos não funcionais, existem três subcategorias principais:

- *Requisitos de Produto*: Focam-se em características específicas do produto, como segurança, dependências, eficiência e usabilidade.
- *Requisitos de Organização*: Relacionam-se com aspetos operacionais e de desenvolvimento, como os requisitos operacionais (condições de uso do sistema) e os *requisitos de desenvolvimento* (fatores ligados ao ambiente de desenvolvimento e ferramentas utilizadas).
- *Requisitos Externos*: Estes requisitos envolvem fatores externos ao sistema que podem influenciar o seu funcionamento. Incluem requisitos legais (como conformidade com normas e regulamentos), padrões de mercado, regulamentações de segurança ou requisitos impostos por terceiros, como entidades governamentais ou regulatórias.

== Validação

Após o levantamento dos requisitos, estes foram apresentados ao CEO da empresa para validação. Durante a reunião, cada requisito foi cuidadosamente analisado e discutido, garantindo que todos os requisitos estivessem alinhados com as necessidades da empresa.
O Sr. Odin sugeriu que fosse incluído na documentação de cada requisito a sua origem, especificando de onde ele foi retirado.
Com esta alteração incorporada, os requisitos foram ajustados e validados, permitindo avançar para a especificação e modelação do _software_.

= Especificação e Modelação do _Software_

== Apresentação geral da especificação

A *especificação e modelação do _software_* pode ser organizada em dois tópicos essenciais: aspetos estruturais, que incluem o modelo de domínio; e aspetos comportamentais, que englobam os diagramas de casos de uso e as suas especificações, bem como o comportamento que cada utilizador pode tomar no sistema. Para a criação e documentação destas especificações, foi utilizada a ferramenta *Visual Paradigm*, suportada pela linguagem UML, o que facilita a modelação detalhada do sistema.

O *modelo de domínio* descreve a estrutura do sistema, identificando as entidades principais e os seus relacionamentos no domínio do problema, criando uma base sólida para o desenvolvimento posterior do _software_.

Os *diagramas de casos de uso* proporcionam uma visão dos principais cenários de interação entre o sistema e os utilizadores. Já a especificação dos casos de uso descreve como é que os utilizadores interagem com o sistema para alcançarem os seus objetivos, permitindo identificar os atores principais e os fluxos de eventos que representam os casos de uso.
Os *comportamentos do utilizador* detalham os fluxos internos de cada utilizador, recorrendo aos casos de uso, permitindo uma compreensão mais detalhada das etapas realizadas pelos utilizadores e do comportamento esperado do sistema em cada situação.

== Aspetos estruturais

Dada a importância da definição dos aspetos estruturais para o desenvolvimento de um sistema de _software_ robusto e eficaz, foi essencial identificar as entidades e os relacionamentos presentes no modelo de domínio. Este modelo foi construído a partir da análise dos requisitos funcionais especificados.

#figure(
  caption: "Modelo de Domínio",
  kind: image,
  image("images/modelodo.png", width: 80%)
)

A entidade central do modelo é a *Encomenda*, esta representa cada pedido realizado pelos clientes, como se verifica no *requisito funcional nº 8 - Visualização das encomendas*. Esta entidade está diretamente ligada a múltiplas componentes fundamentais para a operação do sistema. A Encomenda é identificada por um *ID* único, possui uma *Data* e está associada a um *Estado*, podendo este variar entre “Em processamento”, “Em montagem” e “Concluída”, podendo verificar isso através do *requisito funcional nº8*. Cada encomenda também se encontra numa *Etapa* de montagem, como está previsto no *requisito funcional nº 2 - Registo do processo de montagem -* e suporta o *requisito funcional nº 3 - Visualização do processo de montagem*, que se foca na visualização desse progresso por parte dos clientes e funcionários.

Cada *Encomenda* é composta por apenas um *Produto*, sendo que cada *Produto* inclui um conjunto específico de *Peças* necessárias para sua montagem. Cada *Produto* é caracterizado por um *ID* único, um *Nome*, uma *Descrição,* uma *Peça*, uma *Imagem* e as etapas da sua montagem com *Imagens*. Segundo o *requisito funcional nº4 - Gestão do catálogo de produtos*, os produtos estão também opcionalmente presentes num *Catálogo* geral do sistema que pode ser atualizado por um *Gestor*.

Os *Clientes* são um dos tipos de utilizadores presentes no sistema identificados por um identificador único, nome e uma senha. O mesmo tem uma ligação com uma encomenda. Além disso, a ligação entre a *Encomenda* e o *Cliente* reflete a interação que permite ao cliente acompanhar os detalhes e estado das suas encomendas em tempo real, como está previsto no *requisito funcional nº 8 - Visualização das encomendas*.

Os fornecedores e os gestores são também um tipo de utilizadores que partilham características semelhantes e desempenham um papel fundamental na criação e produção de um produto, como podemos verificar no *requisito funcional nº 9 - Encomenda de peças -* e no *requisito funcional nº 10 - Gestão de Encomendas pelo Fornecedor*. Ambos são responsáveis por atualizar o _stock_, seja através do fornecimento ou da solicitação de peças necessárias. Adicionalmente, cabe aos gestores a gestão do catálogo de produtos, incluindo a adição e remoção de itens, conforme necessário, como se verifica no *requisito funcional nº 7 - Visualização do Catálogo* e no *requisito funcional nº 4 - Gestão do catálogo de produtos*.

O modelo de domínio também tem em conta a relação entre *Peça*, *Fornecedor* e *Gestor*, de modo que o _stock_ das peças é pedido pelo Gestor e fornecido pelo Fornecedor, tendo em conta os *requisitos funcionais nº 10 - Gestão de Encomendas pelo Fornecedor -, nº 11 - Atualização Manual de _Stock_ - e nº 13 - Registo na aplicação dos Novos Fornecedores e Funcionários*. Esta funcionalidade assegura que a empresa possa gerir as suas peças de forma eficiente.

Os funcionários são responsáveis pela construção e produção dos produtos, como se verifica no *requisito funcional nº 2 - Registo do processo de montagem*.

Por fim, a *Encomenda* é processada por *Funcionários* que atualizam o estado do pedido em cada etapa, como está previsto pelo requisito funcional nº 2.

== Aspetos Comportamentais

=== Casos de Uso

Os casos de uso identificam os principais objetivos dos diferentes perfis de utilizadores – clientes, gestores, funcionários e fornecedores – detalhando as suas interações com o sistema. Esta abordagem facilita a compreensão de como o sistema atende às necessidades específicas de cada utilizador, assegurando uma experiência eficiente e intuitiva.

#figure(
  caption: "Diagrama de Casos de Uso Global",
  kind: image,
  image("images/UC/TUC.png", width: 80%)
)

Neste diagrama de casos de uso, podemos visualizar todos os casos de uso específicos do cliente.
#figure(
  caption: "Diagrama de Casos de Uso - Cliente",
  kind: image,
  image("images/UC/C.png", width: 60%)
)

Neste diagrama de casos de uso, podemos visualizar todos os casos de uso específicos do fornecedor.
#figure(
  caption: "iagrama de Casos de Uso - Fornecedor",
  kind: image,
  image("images/UC/For.png", width: 60%)
)

Neste diagrama de casos de uso, podemos visualizar todos os casos de uso específicos do funcionário.
#figure(
  caption: "iagrama de Casos de Uso - Funcionário",
  kind: image,
  image("images/UC/F.png", width: 60%)
)

Neste diagrama de casos de uso, podemos visualizar todos os casos de uso específicos do gestor.
#figure(
  caption: "iagrama de Casos de Uso - Gestor",
  kind: image,
  image("images/UC/Ges.png", width: 60%)
)
#pagebreak()
==== Consultar o _stock_ das peças

Este caso de uso foi descrito com base no *requisito funcional nº 1 - Verificação de stock de peças*.
#figure(
  caption: "Caso de Uso 1 - Consultar o _stock_ das peças",
  kind: image,
  image("images/UC/1.png", width: 90%)
)

==== Verificar _stock_ de peças solicitadas para reposição

Este caso de uso foi descrito com base no *requisito funcional nº 1 - Verificação de stock de peças*.
#figure(
  caption: "Caso de Uso 2 - Verificar _stock_ de peças solicitadas para reposição",
  kind: image,
  image("images/UC/2.png", width: 90%)
)

#pagebreak()
==== Visualizar progresso de montagem de uma encomenda (Cliente)

Este caso de uso foi descrito com base no *requisito funcional nº 3 - Visualização do processo de montagem*.
#figure(
  caption: "Caso de Uso 3 - Visualizar progresso de montagem de uma encomenda",
  kind: image,
  image("images/UC/3.png", width: 90%)
)

==== Visualizar o progresso de montagem de uma encomenda (Funcionário)

Este caso de uso foi descrito com base no *requisito funcional nº 3 - Visualização do processo de montagem*.
#figure(
  caption: "Caso de Uso 4 - Visualizar o progresso de montagem de uma encomenda",
  kind: image,
  image("images/UC/4.png", width: 90%)
)

==== Adicionar produtos ao catálogo da empresa

Este caso de uso foi descrito com base no *requisito funcional nº 4 - Gestão do catálogo de produtos*.
#figure(
  caption: "Caso de Uso 5 - Adicionar produtos do catálogo da empresa",
  kind: image,
  image("images/UC/5.png", width: 90%)
)

#pagebreak()
==== Remover produtos do catálogo da empresa

Este caso de uso foi descrito com base no *requisito funcional nº 4 - Gestão do catálogo de produtos*.
#figure(
  caption: "Caso de Uso 6 - Remover produtos do catálogo da empresa",
  kind: image,
  image("images/UC/6.png", width: 90%)
)

==== Visualizar o catálogo de produtos da empresa sem iniciar sessão

Este caso de uso foi descrito com base no *requisito funcional nº 7 - Visualização do Catálogo*.
#figure(
  caption: "Caso de Uso 7 - Visualizar o catálogo de produtos da empresa sem iniciar sessão",
  kind: image,
  image("images/UC/7.png", width: 90%)
)

#pagebreak()
==== Visulização das encomendas (Cliente)

Este caso de uso foi descrito com base no *requisito funcional nº 8 - Visualização das encomendas*.
#figure(
  caption: "Caso de Uso 8 - Visulização das encomendas",
  kind: image,
  image("images/UC/8.png", width: 90%)
)

==== Visualização das encomendas (Funcionário)

Este caso de uso foi descrito com base no *requisito funcional nº 8 - Visualização das encomendas*.
#figure(
  caption: "Caso de Uso 9 - Consultar o _stock_ das peças",
  kind: image,
  image("images/UC/9.png", width: 90%)
)
#pagebreak()
==== Registo do processo de montagem

Este caso de uso foi descrito com base no *requisito funcional nº 2 - Registo do processo de montagem*.
#figure(
  caption: "Caso de Uso 10 - Registo do processo de montagem",
  kind: image,
  image("images/UC/10.png", width: 90%)
)

#pagebreak()
==== Iniciar sessão

Este caso de uso foi descrito com base no *requisito funcional nº 17 - Iniciar Sessão*.
#figure(
  caption: "Caso de Uso 11 - Iniciar sessão",
  kind: image,
  image("images/UC/11.png", width: 90%)
)

==== Terminar Sessão

Este caso de uso foi descrito com base no *requisito funcional nº 18 - Terminar Sessão*.
#figure(
  caption: "Caso de Uso 12 - Terminar Sessão",
  kind: image,
  image("images/UC/12.png", width: 90%)
)

#pagebreak()
==== Encomenda de peças

Este caso de uso foi descrito com base no *requisito funcional nº 9 - Encomenda de peças*.
#figure(
  caption: "Caso de Uso 13 - Encomenda de peças",
  kind: image,
  image("images/UC/13.png", width: 90%)
)

==== Visualizar encomendas de peças

Este caso de uso foi descrito com base no *requisito funcional nº 10 - Gestão de Encomendas pelo Fornecedor*.
#figure(
  caption: "Caso de Uso 14 - Visualizar encomendas de peças",
  kind: image,
  image("images/UC/14.png", width: 90%)
)

==== Atualizar estado de encomenda de peças

Este caso de uso foi descrito com base no *requisito funcional nº 10 - Gestão de Encomendas pelo Fornecedor*.
#figure(
  caption: "Caso de Uso 15 - Atualizar estado de encomenda de peças",
  kind: image,
  image("images/UC/15.png", width: 90%)
)
#pagebreak()
==== Atualização manual do _stock_ de peças

Este caso de uso foi descrito com base no *requisito funcional nº 11 - Atualização Manual de _Stock_*.
#figure(
  caption: "Caso de Uso 16 - Atualização manual do stock de peças",
  kind: image,
  image("images/UC/16.png", width: 90%)
)

#pagebreak()
==== Descontinuação de peça

Este caso de uso foi descrito com base no *requisito funcional nº 12 - Registo e atualização de peças pelo Fornecedor*.
#figure(
  caption: "Caso de Uso 17 - Descontinuação de peça",
  kind: image,
  image("images/UC/17.png", width: 90%)
)

#pagebreak()
==== Alteração de informação de peça

Este caso de uso foi descrito com base no *requisito funcional nº 12 - Registo e atualização de peças pelo Fornecedor*.
#figure(
  caption: "Caso de Uso 18 - Alteração de informação de peça.",
  kind: image,
  image("images/UC/18.png", width: 90%)
)

#pagebreak()
==== Registo de nova peça no sistema

Este caso de uso foi descrito com base no *requisito funcional nº 12 - Registo e atualização de peças pelo Fornecedor*.
#figure(
  caption: "Caso de Uso 19 - Registo de nova peça no sistema",
  kind: image,
  image("images/UC/19.png", width: 90%)
)

#pagebreak()
==== Registar na aplicação novo Funcionário

Este caso de uso foi descrito com base no *requisito funcional nº 13 - Registo na aplicação dos Novos Fornecedores e Funcionários*.
#figure(
  caption: "Caso de Uso 20 - Registar na aplicação novo Funcionário",
  kind: image,
  image("images/UC/20.png", width: 90%)
)

#pagebreak()
==== Registar na aplicação novo Fornecedor

Este caso de uso foi descrito com base no *requisito funcional nº 13 - Registo na aplicação dos Novos Fornecedores e Funcionários*.
#figure(
  caption: "Caso de Uso 21 - Registar na aplicação novo Fornecedor",
  kind: image,
  image("images/UC/21.png", width: 90%)
)
#pagebreak()

==== Remover da aplicação antigo Fornecedor ou Funcionário

Este caso de uso foi descrito com base no *requisito funcional nº 14 - Remoção na aplicação dos Novos Fornecedores e Funcionários*.
#figure(
  caption: "Caso de Uso 22 - Remover da aplicação antigo Fornecedor ou Funcionário",
  kind: image,
  image("images/UC/22.png", width: 90%)
)
#pagebreak()

==== Visualizar produto (Gestor, Fornecedor, Funcionário)

Este caso de uso foi descrito com base no *requisito funcional nº 15 - Visualizar produto*.
#figure(
  caption: "Caso de Uso 23 - Visualizar produto",
  kind: image,
  image("images/UC/23.png", width: 90%)
)

==== Visualizar produto (Cliente)

Este caso de uso foi descrito com base no *requisito funcional nº 15 - Visualizar produto*.
#figure(
  caption: "Caso de Uso 24 - Visualizar produto",
  kind: image,
  image("images/UC/24.png", width: 90%)
)

==== Ordenar Catálogo

Este caso de uso foi descrito com base no *requisito funcional nº 16 - Ordenar catálogo*.
#figure(
  caption: "Caso de Uso 25 - Ordenar Catálogo",
  kind: image,
  image("images/UC/25.png", width: 90%)
)

==== Visualização de uma encomenda

Este caso de uso foi descrito com base no *requisito funcional nº 8 - Visualização das encomendas*.
#figure(
  caption: "Caso de Uso 26 - Visualização de uma encomenda",
  kind: image,
  image("images/UC/26.png", width: 90%)
)


=== Comportamento do utilizador

Complementando os casos de uso, os diagramas de atividades foram elaborados para detalhar os *comportamentos do utilizador*. Estes diagramas descrevem as ações realizadas pelos utilizadores ao interagir com o sistema, ilustrando as etapas necessárias para atingir os seus objetivos. Cada diagrama mostra o percurso lógico seguido pelo utilizador, onde cada ação está associada a um caso de uso.

==== Comportamento do Cliente

Este diagrama ilustra o percurso do cliente ao acompanhar o estado da montagem do mobiliário. O fluxo começa com o cliente a iniciar sessão e selecionar uma encomenda específica. Em seguida, é apresentada uma visualização detalhada do progresso da montagem, com informações sobre as etapas já concluídas e as pendentes. Para descrevermos este comportamento do Cliente, usámos como base os seguintes casos de uso: *caso de uso 3*, *caso de uso 7*, *caso de uso 8*, *caso de uso 11*, *caso de uso 12*, *caso de uso 24*, *caso de uso 25*, *caso de uso 26*, de modo que este diagrama também tem por base os requisitos funcionais de cada caso de uso referido.

#figure(
  caption: "Comportamento do Cliente",
  kind: image,
  image("images/Cliente.png", width: 90%)
)

==== Comportamento do Fornecedor

Este diagrama mostra o fluxo de trabalho do fornecedor, que envolve o acesso aos pedidos de reposição de peças enviados pelo sistema. O fornecedor pode verificar o estado dos pedidos, atualizar informações sobre a disponibilidade de itens e confirmar o envio de peças. Para descrevermos este comportamento do Fornecedor, usámos como base os seguintes casos de uso: *caso de uso 2*, *caso de uso 7*, *caso de uso 11*, *caso de uso 12*, *caso de uso 14*, *caso de uso 15*, *caso de uso 17*, *caso de uso 18*, *caso de uso 19* *caso de uso 23*, *caso de uso 25*, de modo que este diagrama também tem por base os requisitos funcionais de cada caso de uso referido.

#figure(
  caption: "Comportamento do Fornecedor",
  kind: image,
  image("images/Fornecedor.jpg", width: 90%)
)

==== Comportamento do Funcionário

Este diagrama descreve como os funcionários utilizam o sistema para monitorizar o progresso das tarefas atribuídas. O fluxo cobre desde o início da sessão até a consulta e atualização do estado de montagem. Para descrevermos este comportamento do Funcionário, usámos como base os seguintes casos de uso: *caso de uso 4*, *caso de uso 7*, *caso de uso 9*, *caso de uso 11*, *caso de uso 12*, *caso de uso 16* *caso de uso 23*, *caso de uso 25*, *caso de uso 26*, de modo que este diagrama também tem por base os requisitos funcionais de cada caso de uso referido.

#figure(
  caption: "Comportamento do Funcionário",
  kind: image,
  image("images/Funcionário.jpg", width: 90%)
)

==== Comportamento do Gestor

Este diagrama detalha as ações do gestor na administração de peças e recursos. O fluxo começa com o gestor a aceder à interface de gestão, onde pode consultar o estado do _stock_, adicionar novas peças, modificar informações ou remover itens descontinuados. O objetivo é assegurar que os recursos necessários para as montagens estão sempre disponíveis.
Para descrevermos este comportamento do Gestor, usámos como base os seguintes casos de uso: *caso de uso 1*, *caso de uso 5*, *caso de uso 6*, *caso de uso 7*, *caso de uso 11*, *caso de uso 12*, *caso de uso 13*, *caso de uso 14*, *caso de uso 20*, *caso de uso 21*, *caso de uso 22*, *caso de uso 23*, *caso de uso 25*, *caso de uso 26*, de modo que este diagrama também tem por base os requisitos funcionais de cada caso de uso referido.

#figure(
  caption: "Comportamento do Gestor",
  kind: image,
  image("images/Gestor.png", width: 90%)
)

= Conceção do Sistema de Dados

== Apresentação geral da estrutura (esquema) do sistema de dados

Com base numa análise detalhada dos requisitos funcionais, foi desenvolvido o modelo lógico da base de dados para a empresa Valhala, onde é garantido um suporte às operações e funcionalidades necessárias. Este modelo foi construído com o auxílio do modelo de domínio - especificado no capítulo 3 - este serviu como principal referência para assegurar que o modelo lógico mantivesse a coerência com as necessidades reais do sistema e as suas interações.

Durante o processo de desenvolvimento deste modelo, seguimos uma abordagem meticulosa e estruturada, garantindo que cada entidade identificada no modelo de domínio fosse corretamente representada no modelo lógico, podendo esta ser uma tabela ou um atributo. Além disso, os relacionamentos entre as entidades (que geraram tabelas) foram traduzidos em chaves estrangeiras ou novas tabelas dependendo da sua cardinalidade.

O processo iniciou-se com as entidades de menor dependência, como o “Cliente”, “Fornecedor”, “Funcionário” e “Gestor”, que representam os diferentes utilizadores. De seguida, fomos gradualmente para as outras entidades e relacionamentos, finalizando o processo de construção de tabelas com a “Encomenda” e os seus relacionamentos, visto que esta é a tabela que possui mais dependências. 

Durante este processo, a ferramenta _MySQL Workbench_ foi utilizada para modelar e validar o esquema, o que permitiu verificar a consistência do modelo. Assim, o modelo lógico desenvolvido está apto para suportar a base de dados da Valhala, promovendo uma estrutura que permite operações eficientes e uma fácil manutenção dos dados.


== Descrição detalhada dos vários elementos de dados

A explicação minuciosa dos dados ajuda a entender como cada tabela foi elaborada no sistema Valhala. Este processo é crucial para garantir que a modelagem lógica do banco de dados reflita com precisão as necessidades do negócio e garanta eficiência na gestão das operações.

Cada tabela foi elaborada seguindo o modelo de domínio e os requisitos funcionais do sistema, mostrando uma organização clara com campos, chaves primárias e estrangeiras bem definidos, necessários para suportar as operações do sistema. A análise de cada tabela revela as funcionalidades específicas que ela permite, como a administração de pedidos, clientes, mercadorias e outros aspectos importantes do sistema. 

Nesta parte são mostradas as tabelas criadas, com explicações mostrando como cada uma influencia no funcionamento completo da aplicação.

#figure(
  caption: "Modelo lógico",
  kind: image,
  image("images/BD/Modelo.png", width: 90%)
)

=== Encomenda

Segundo o *requisito funcional nº 8 - Visualização das encomendas -*, temos a necessidade de ter uma tabela que represente uma Encomenda. Assim, a tabela *Encomenda* foi criada a partir da entidade Encomenda como parte do processo de modelação lógica da base de dados, com o objetivo de registar e gerir as encomendas realizadas pelos clientes da empresa Valhala. 

O *ID* é a chave primária, garantindo a identificação única de cada encomenda, sendo do tipo *INT*. Enquanto as chaves estrangeiras *Cliente*, *Produto* e *Etapa* associam a encomenda aos dados correspondentes. O campo *Estado* é importante para indicar a fase da encomenda, auxiliando o acompanhamento do seu progresso.

Além disso, a Encomenda permite seguir a encomenda desde a sua criação até à entrega, com o auxílio dos campos *Data de Criação* e *Data de Entrega*.

Esta estrutura permite uma gestão eficiente das encomendas.

#figure(
  caption: "Modelo lógico da tabela Encomenda",
  kind: image,
  image("images/BD/EncomendaBD.png", width: 25%)
)

#figure(
  caption: "Caracterização da Entidade Encomenda",
  kind: image,
  image("images/BDExcel/Enco.png", width: 100%)
)

=== Produto

Tendo em conta o *requisito funcional nº 4 - Gestão do catálogo de produtos -*, temos a necessidade de ter uma tabela que represente um Produto.
A tabela *Produto* é responsável por registar informações detalhadas sobre os produtos disponíveis na empresa. O *ID* é a chave primária, assegurando a identificação única de cada produto. Para além disso, também contém informação essencial, como *Nome*, *Preço* e *Descrição*, o que ajuda a esclarecer o que é o produto.

Além disso, a tabela permite a adição de uma imagem do produto, facilitando a experiência do utilizador.

#figure(
  caption: "Modelo lógico da tabela Produto",
  kind: image,
  image("images/BD/ProdutoBD.png", width: 30%)
)

#figure(
  caption: "Caracterização da Entidade Produto",
  kind: image,
  image("images/BDExcel/Prod.png", width: 100%)
)

=== Gestor

Tendo em conta o *requisito funcional nº 1 - Verificação de _stock_ de peças -*, temos a necessidade de ter uma tabela que represente um Gestor.
A tabela *Gestor* é fundamental para o controlo e segurança do sistema, armazenando as informações essenciais sobre os gestores da Valhala. Cada gestor é identificado de forma única, o que facilita a atribuição de permissões específicas e o controlo de acessos ao sistema.

Esta tabela também possibilita o controlo das ações e alterações feitas por cada gestor, permitindo realizar um rastreamento das suas atividades. Isto é especialmente útil para manter a responsabilidade e segurança dentro da empresa.

#figure(
  caption: "Modelo lógico da tabela Gestor",
  kind: image,
  image("images/BD/GestorBD.png", width: 30%)
)

#figure(
  caption: "Caracterização da Entidade Gestor",
  kind: image,
  image("images/BDExcel/Gestor.png", width: 100%)
)

=== Cliente

Segundo o *requisito funcional nº 8 - Visualização das encomendas -*, temos a necessidade de ter uma tabela que represente um Cliente.
A tabela *Cliente* é essencial para o registo e gestão dos indivíduos que efetuaram encomendas de produtos, armazenando informações importantes sobre cada cliente. Cada cliente é identificado de forma única, facilitando o acompanhamento das encomendas e oferece uma visão completa do histórico de encomendas assim possibilitando uma melhor gestão dos pedidos e necessidades dos clientes.

#figure(
  caption: "Modelo lógico da tabela Cliente",
  kind: image,
  image("images/BD/ClienteBD.png", width: 30%)
)

#figure(
  caption: "Caracterização da Entidade Cliente",
  kind: image,
  image("images/BDExcel/Cliente.png", width: 100%)
)

=== Funcionário

Tendo em conta o *requisito funcional nº 2 - Registo do processo de montagem -*, temos a necessidade de ter uma tabela que represente um Funcionário.
A tabela *Funcionário* é fundamental para a produção e gestão das encomendas, armazenando informações essenciais sobre os indivíduos responsáveis pela construção dos produtos e pela atualização dos estados das encomendas e das etapas de produção. Cada funcionário é identificado de forma única, permitindo uma supervisão eficaz das suas atividades e das etapas em que atuam.

#figure(
  caption: "Modelo lógico da tabela Funcionário",
  kind: image,
  image("images/BD/FuncionarioBD.png", width: 30%)
)

#figure(
  caption: "Caracterização da Entidade Funcionário",
  kind: image,
  image("images/BDExcel/Funcion.png", width: 100%)
)

=== Peça

Tendo em conta o *requisito funcional nº 9 - Encomenda de peças -*, temos a necessidade de ter uma tabela que represente uma Peça.
A tabela *Peça* representa as peças que são utilizadas na montagem dos produtos da empresa. O *ID* da peça é a sua chave primária, garantindo que cada item tem uma identificação única. Esta entidade regista informações essenciais sobre cada peça, tais como a quantidade disponível em _stock_ e uma imagem associada, o que facilita a visualização e identificação de cada peça por parte dos utilizadores.

Além disso, cada peça está associada a um *fornecedor*, facilitando os pedidos de reposição de _stock_.

#figure(
  caption: "Modelo lógico da tabela Peça",
  kind: image,
  image("images/BD/PeçaBD.png", width: 30%)
)

#figure(
  caption: "Caracterização da Entidade Peça",
  kind: image,
  image("images/BDExcel/Peça.png", width: 100%)
)

=== Etapa

Segundo o *requisito funcional nº 2 - Registo do processo de montagem -*, temos a necessidade de ter uma tabela que represente uma Etapa.
A tabela *Etapa* representa os diferentes passos do processo de montagem de um determinado produto. O seu *ID* é a chave primária, garantindo a identificação única de cada fase no sistema. Cada etapa contêm uma imagem que ilustra o que é necessário fazer naquele passo, facilitando o acompanhamento do progresso por parte dos utilizadores.

Cada etapa está associada a um *produto* em específico. 

#figure(
  caption: "Modelo lógico da tabela Etapa",
  kind: image,
  image("images/BD/EtapaBD.png", width: 30%)
)

#figure(
  caption: "Caracterização da Entidade Etapa",
  kind: image,
  image("images/BDExcel/Etapa.png", width: 100%)
)

=== Fornecedor

Tendo em conta o *requisito funcional nº 10 - Gestão de Encomendas pelo Fornecedor -*, temos a necessidade de ter uma tabela que represente um Fornecedor.
A tabela *Fornecedor* resulta da entidade Fornecedor como parte do processo de modelação lógica da base de dados.

O *ID* é a chave primária, garantindo a identificação única de cada fornecedor, sendo do tipo *INT*.  Para além disso, também contém o *Nome* e e *Senha* a ser utilizada no processo de autenticação no sistema.

#figure(
  caption: "Modelo lógico da tabela Fornecedor",
  kind: image,
  image("images/BD/FornecedorBD.png", width: 30%)
)

#figure(
  caption: "Caracterização da Entidade Fornecedor",
  kind: image,
  image("images/BDExcel/Fornecedor.png", width: 100%)
)

=== PedidoPeça

Segundo o *requisito funcional nº 9 - Encomenda de peças -*, temos a necessidade de ter uma tabela que represente um Pedido de Peça.
A tabela *PedidoPeça,* representa as encomendas de peças (utilizadas para o fabrico de produtos) colocadas por gestores da empresa aos fornecedores para repor o *_stock_* das mesmas.

O *ID* é a chave primária, garantindo a identificação única de cada encomenda, a *Quantidade* especifica quantas peças foram encomendadas, e o *Estado* indica a fase da encomenda, auxiliando o acompanhamento do seu progresso.

A chave estrangeira *Peça* identifica a peça encomendada e a chave estrangeira *Gestor* o gestor da empresa responsável pela encomenda em questão.

#figure(
  caption: "Modelo lógico da tabela PedidoPeça",
  kind: image,
  image("images/BD/PedidoPeçaBD.png", width: 30%)
)

#figure(
  caption: "Caracterização da Entidade PedidoPeça",
  kind: image,
  image("images/BDExcel/EncomendaPeça.png", width: 100%)
)

== Descrição detalhada dos vários elementos de relacionamentos

=== Peça_Etapa

Segundo o *requisito funcional nº 2 - Registo do processo de montagem -*, é essencial ter um relacionamento entre Peça e Etapa.
O relacionamento entre as entidades Peça e Etapa é uma relação muitos para muitos. Cada peça pode estar presente em várias etapas durante o processo de montagem, e cada etapa pode incluir várias peças. De forma a representar corretamente esta relação no modelo lógico, foi criada uma tabela intermediária, designada por *Peça_Etapa*, que guarda a ligação entre as peças e a sua quantidade usada na etapa.

A chave primária desta tabela é composta pelas duas chaves estrangeiras: *Peça_ID* (referência à tabela “Peça”) e *Etapa_ID* (referência à tabela “Etapa”).

#figure(
  caption: "Modelo lógico da tabela Peça_Etapa",
  kind: image,
  image("images/BD/PeçaEtapa.png", width: 50%)
)

=== Funcionário_Encomenda

Segundo o *requisito funcional nº 2 - Registo do processo de montagem -*, é essencial ter um relacionamento entre Funcionário e Encomenda.
O relacionamento entre as entidades *Funcionário* e *Encomenda* é uma relação muitos para muitos. Cada Encomenda pode estar associada a vários funcionários que serão responsáveis pelo seu processo de montagem e realização. Para representar corretamente essa relação no modelo lógico, foi criada a tabela *Peça_Funcionário* que regista as ligações entre Encomendas e Peças.

A chave primária desta tabela é composta pelas duas chaves estrangeiras: *Funcionário_ID* (referência à tabela “Funcionário”) e *Encomenda_ID* (referência à tabela “Encomenda”).

#figure(
  caption: "Modelo lógico da tabela Funcionário_Encomenda",
  kind: image,
  image("images/BD/FuncioEncomBD.png", width: 50%)
)


=== Peça_Funcionário

Tendo em conta o *requisito funcional nº 11 - Atualização Manual de _Stock_ -*, é importante ter um relacionamento entre Funcionário e Peça.
O relacionamento entre *Peças* e *Funcionários* é de muitos-para-muitos; ou seja, cada peça pode estar associada a vários funcionários durante o processo de montagem, e cada funcionário pode utilizar várias peças. Para representar corretamente essa relação no modelo lógico, foi criada uma nova tabela, *Peça_Funcionário*, que armazena as associações entre as duas entidades.

A chave primária desta tabela é composta pelas duas chaves estrangeiras, *Peça_Id* e *Funcionário_Id*, que referem, respetivamente, as tabelas *Peça* e *Funcionário*.

#figure(
  caption: "Modelo lógico da tabela Peça_Funcionário",
  kind: image,
  image("images/BD/PecaFuncBD.png", width: 50%)
)


=== Peça_Fornecedor : Peça(0,n) para (1,1) Fornecedor

Tendo em conta o *requisito funcional nº 12 - Registo e atualização de peças pelo Fornecedor -*, é importante ter um relacionamento entre Fornecedor e Peça.
O relacionamento entre *Peça* e *Fornecedor* é de *um para muitos*, ou seja, várias peças estão associadas a um fornecedor. Este relacionamento é representado pela entidade *Peça_fornecedor*, onde a tabela *Peça* contém uma chave estrangeira que aponta para a tabela *Fornecedor*.

#figure(
  caption: "Modelo lógico do relacionamento Peça_Fornecedor",
  kind: image,
  image("images/BD/FornePecaBD.png", width: 50%)
)

=== Encomenda_Cliente: Encomenda (0,n) para (1,1) Cliente

Tendo em conta o *requisito funcional nº 8 - Visualização das encomendas -*, é importante ter um relacionamento entre Encomenda e Cliente.
Um Cliente pode efetuar várias encomendas, mas uma encomenda pode ser pedida apenas por um único cliente.

Dado que cada encomenda está associada a um cliente específico, a chave estrangeira *Cliente_ID* foi incluída diretamente na tabela *Encomenda*. Isso possibilita identificar facilmente o cliente associado a cada encomenda.

#figure(
  caption: "Modelo lógico do relacionamento Encomenda_Cliente",
  kind: image,
  image("images/BD/ClienteEncomBD.png", width: 50%)
)


=== Encomenda_Produto: Encomenda (0,n) para (1,1) Produto

Segundo o *requisito funcional nº 8 - Visualização das encomendas -*, é importante ter um relacionamento entre Encomenda e Produto.
Uma encomenda contém sempre um produto específico, mas cada produto pode estar associado a várias encomendas.

O identificador do produto (*Produto_ID*) foi adicionado à tabela *Encomenda* como chave estrangeira. 

#figure(
  caption: "Modelo lógico do relacionamento Encomenda_Produto",
  kind: image,
  image("images/BD/EncomProdBD.png", width: 50%)
)


=== Encomenda_Etapa: Encomenda (0,n) para (0,1) Etapa

Segundo o *requisito funcional nº 2 - Registo do processo de montagem -*, é importante ter um relacionamento entre Encomenda e Etapa.
Uma encomenda pode ou não estar associada a uma etapa específica do processo de produção. A associação ocorre somente quando o produto da encomenda está na fase de montagem. Além disso, uma etapa pode englobar várias encomendas ao mesmo tempo.

O identificador da etapa (*Etapa_ID*) foi adicionado à tabela *Encomenda* como chave estrangeira.

#figure(
  caption: "Modelo lógico do relacionamento Encomenda_Peça",
  kind: image,
  image("images/BD/EncoEtapaBD.png", width: 50%)
)


=== Gestor_PedidoPeça: PedidoPeça (0,n) para (1,1) Gestor

Tendo em conta o *requisito funcional nº 9 - Encomenda de Peças -*, é necessário ter um relacionamento entre Gestor e PedidoPeça.
Cada *Pedido de Peça* está associado a um *Gestor* específico.

Tendo em conta esta relação, o atributo *Gestor* (referência ao ID na tabela “Gestor”) foi adicionado à tabela PedidoPeça como chave estrangeira.

#figure(
  caption: "Modelo lógico do relacionamento Gestor_PedidoPeça",
  kind: image,
  image("images/BD/GestPedidBD.png", width: 50%)
)

=== Etapa_Produto: Etapa (0,n) para (0,1) Produto

Segundo o *requisito funcional nº 3 - Visualização do processo de montagem -*, é importante ter um relacionamento entre Etapa e Produto.
Cada *Etapa* do processo de montagem está associada a um *Produto* específico. Assim, cada etapa corresponde a uma fase do processo de montagem.

Tendo em conta esta relação, o atributo *Produto* foi adicionado à tabela *Etapa* como chave estrangeira.

#figure(
  caption: "Modelo lógico do relacionamento Etapa_Produto",
  kind: image,
  image("images/BD/ProdEtapaBD.png", width: 50%)
)


=== PedidoPeça_Peça: PedidoPeça (0,n) para (0,1) Peça

Tendo em conta o *requisito funcional nº 9 - Encomenda de Peças -*, é necessário ter um relacionamento entre Peça e PedidoPeça.
O relacionamento entre *PedidoPeça* e *Peça* define que cada pedido de peça se refere a uma peça específica.

De modo que o atributo *Peça_ID* foi adicionado à tabela *PedidoPeça* como chave estrangeira.

#figure(
  caption: "Modelo lógico do relacionamento PedidoPeça_Peça",
  kind: image,
  image("images/BD/PeçaPedidoBD.png", width: 50%)
)

== Validação

Após finalizar o desenvolvimento do modelo lógico da base de dados, foi realizada uma validação completa para garantir que este cumpre todos os requisitos identificados anteriormente e está de acordo com o modelo de domínio.

Durante a validação, analisámos as tabelas e os relacionamentos para assegurar que as dependências funcionais se encontravam corretas, de modo a evitar redundâncias. Com isto, reparámos que o relacionamento Produto_Peça era redudante, pois temos os relacionamentos *Etapa_Produto* e *Peça_Etapa*, de modo que como não é necessário aceder às peças constituintes do Produto, removemos esse relacionamento. Tendo o Sr.Odin aprovado o modelo lógico da base de dados para o sistema Valhala.
O modelo foi normalizado até à terceira forma normal (3FN), garantindo que:

1.  Todas as tabelas do modelo possuem uma chave primária única.
2. Cada tabela possui atributos que dependem completamente da chave primária.
3. O modelo lógico não apresenta qualquer dependência transitiva nas tabelas.

Concluímos assim que o modelo lógico está bem estruturado, encontrando-se em condições para corresponder às operações da empresa de forma eficiente e confiável.

= Esboço das Interfaces do Sistema

== Estrutura geral das interfaces do sistema

Após a definição do sistema, desde o levantamento de requisitos até à sua conceção do sistema de dados, iniciou-se o desenvolvimento das interfaces do sistema, sendo possível estruturar graficamente a aplicação. Criámos *mockups* - representações visuais da interface final - contendo diversos elementos relevantes para a interface, tais como cores, ícones e tipografia. Para a elaboração destes mockups, utilizámos a ferramenta *Figma*, porque possibilita a criação de protótipos de alta qualidade em conjunto, otimizando o fluxo de trabalho.

Assim, foram criados mockups para os cenários de:

- Página inicial genérica
- Catálogo
- Linha de montagem
- Lista de encomendas
- Ver encomenda
- Ver produto
- Adicionar Produto
- Lista de peças
- Edição de peças
- Gestão de utilizadores
- Registo e remoção de fornecedores e funcionários
- Autenticação

Estes mockups são cruciais para garantir que a experiência de utilizador seja intuitiva e vá de encontro com os objetivos idealizados. De forma a que estes mockups se enquadrassem nas expectativas do CEO, Sr. Odin, foram realizadas diversas reuniões com o mesmo para que a criação das interfaces fosse bem sucedida e do seu agrado, apelando à natureza de Valhala, característica do próprio país, Suécia.

== Caracterização das interfaces

=== Listar Peças

Este mockup de listagem de peças é voltado para a gestão do inventário de itens utilizados no fabrico de produtos e corresponde ao *caso de uso 1 - Consultar _stock_ de peças,* associado ao *requisito funcional nº1 - Verificação de _stock_ de peças*.

A página é composta por uma tabela paginada que lista todas as peças que fazem parte do processo de montagem dos produtos. As colunas da tabela, apresentam informação das peças como, identificador, _stock_ e fornecedor.

#figure(
  caption: "Mockup de Listar Peças",
  kind: image,
  image("images/mockups/ListaPeças.png", width: 90%)
)

=== Encomenda de peças

Este mockup apresenta a interface de encomenda de peças por parte de um Gestor. Está associado ao *caso de uso 13 - Encomenda de peças* que atende ao *requisito nº 9 - Encomenda de peças*.

O gestor, selecionando uma peça da página de gestão de peças, é apresentado com um pop-up com informação relativa à peça selecionada. Nesse pop-up, carregando no botão de encomendar peça, outro pop-up de confirmação de encomenda é apresentado. Neste pop-up, o gestor insere o _stock_ pretendido e confirma a encomenda.

#figure(
  caption: "Mockup de Encomenda de Peças - Parte 1",
  kind: image,
  image("images/mockups/EncomendaPeças_1.png", width: 90%)
)

#figure(
  caption: "Mockup de Encomenda de Peças - Parte 2",
  kind: image,
  image("images/mockups/EncomendaPeças_2.png", width: 90%)
)

=== Edição de peças

Este mockup apresenta a interface de edição de peças por parte de um Fornecedor. Está associado ao *caso de uso 18 - Alteração de informação de peça* que atende ao *requisito funcional nº12 -* *Registo e atualização de peças pelo Fornecedor*.

O fornecedor, selecionando uma peça da página de gestão de peças, é apresentado com um pop-up com informação editável relativa à peça selecionada.

#figure(
  caption: "Mockup de Edição de Peças",
  kind: image,
  image("images/mockups/EdiçãoPeças.png", width: 90%)
)

=== Registo de novo utilizador

Este mockup apresenta a interface de inserção de um novo utilizador na plataforma. Está associado ao *caso de uso 20 - Registar na aplicação novo trabalhador*  *e caso de uso 21 - Registar na aplicação novo funcionário* associados ao *requisito nº13*.

O gestor solicitando a opção de registo de utilizadores na sidebar geral da aplicação, abre um pop-up, onde, inserindo dados (identificador e senha) e selecionado o tipo de utilizador a criar, é inserida uma nova conta no sistema. 

#figure(
  caption: "Mockup de Registo de novo utilizador",
  kind: image,
  image("images/mockups/NovoUti.png", width: 90%)
)

=== Eliminar utilizador

Este mockup apresenta a interface de remoção de um utilizador da plataforma. Está associado ao *caso de uso 22 - Remover da aplicação antigo Fornecedor ou Trabalhador* que atende ao *requisito funcional nº14 - Remoção na aplicação dos antigos Fornecedores e funcionários*.

O gestor solicitando a opção de remoção de utilizadores na sidebar geral da aplicação, abre um pop-up, onde, inserindo o identificador do utilizador a remover e confirmando a ação, é removida a conta do sistema.  

#figure(
  caption: "Mockup de Eliminar utilizador - Parte 1",
  kind: image,
  image("images/mockups/ElimUti1.png", width: 90%)
)

#figure(
  caption: "Mockup de Eliminar utilizador - Parte 2",
  kind: image,
  image("images/mockups/ElimUti2.png", width: 90%)
)

=== Página Inicial e Catálogo sem Login

Este mockup apresenta a interface de apresentação inicial da aplicação Valhala e, consequentemente, a primeira experiência com o catálogo, disponível sem efetuar login. Está associado ao *caso de uso 7 - Visualizar Catálogo* que atende ao *requisito funcional nº7 - Visualizar Catálogo*.

O utilizador acede à aplicação, sendo envolvido desde a sua entrada por esta visualização, podendo optar posteriormente por escolher a opção catálogo, onde visualizará o mesmo, ou apenas deslizando para baixo. 

#figure(
  caption: "Mockup de Página Inicial",
  kind: image,
  image("images/mockups/CatSem.png", width: 50%)
)

=== Catálogo com Login

Este mockup apresenta a interface do catálogo disponível, após efetuar login. Está associado ao *caso de uso 7 - Visualizar Catálogo* que atende ao *requisito funcional nº7 - Visualizar Catálogo*.

O utilizador é direcionado após realizar login para a página do catálogo.

#figure(
  caption: "Mockup de Catálogo",
  kind: image,
  image("images/mockups/CatCom.png", width: 90%)
)

=== Adicionar Produto

Este mockup apresenta a interface que permite adicionar novos produtos ao catálogo enquanto gestor, após efetuar login. Está associado ao *caso de uso 5 - Adicionar produtos ao catálogo da empresa* que atende ao *requisito funcional nº 4 - Gestão do catálogo da empresa*.

#figure(
  caption: "Mockup de Adicionar Produto",
  kind: image,
  image("images/mockups/CatComAdd.png", width: 90%)
)

=== Ordenar Catálogo

Este mockup demonstra a interface disponível para escolha de método de ordenação do catálogo da aplicação. Está associado ao *caso de uso 25 - Ordenar Catálogo* que atende ao *requisito funcional nº16 - Ordenar Catálogo*.

#figure(
  caption: "Mockup de Ordenar Catálogo",
  kind: image,
  image("images/mockups/CatCom.png", width: 90%)
)

=== Linha de Montagem

Este mockup exemplifica a interface de linha de montagem de um produto, o foco da aplicação Valhala. Está associado ao *caso de uso 3 - Visualizar progresso de montagem de uma encomenda* que atende ao *requisito funcional nº3 - Visualizar progresso de montagem de uma encomenda*.

#figure(
  caption: "Mockup de Linha de Montagem Para Visualização - Parte 1",
  kind: image,
  image("images/mockups/LinhaMontCat1.png", width: 90%)
)

#figure(
  caption: "Mockup de Linha de Montagem Para Visualização - Parte 2",
  kind: image,
  image("images/mockups/LinhaMontCat2.png", width: 90%)
)

Este mockup exemplifica a interface de registo de processo da linha de montagem de um produto, o foco da aplicação Valhala. Está associado ao *caso de uso 10 - Registo do processo de montagem* que atende ao *requisito funcional nº2 - Registo do processo de montagem*.

#figure(
  caption: "Mockup de Linha de Montagem Para Produção - Parte 1",
  kind: image,
  image("images/mockups/LinhaMontEnc1.png", width: 90%)
)

#figure(
  caption: "Mockup de Linha de Montagem Para Produção - Parte 2",
  kind: image,
  image("images/mockups/LinhaMontEnc2.png", width: 90%)
)

=== Lista de Encomendas

Os mockups da lista de encomendas são justificados com base em diferentes casos de uso, atendendo aos requisitos nº 8.1 e 8.2 e aos *casos de usos 8 e 9*, que abrangem funcionalidades para perfis de utilizadores específicos. Um dos mockups representa a *vista do cliente*, permitindo que ele acompanhe suas encomendas de forma simples e objetiva, verificando o estado atual (e.g., "Entregue", "Construção", "Processamento"), informações básicas como identificador, datas de criação e entrega, além de visualizar uma miniatura do produto. Ao clicar na imagem do produto, são reveladas mais informações caso necessário, atendendo ao *caso de uso de consulta de encomendas*, promovendo transparência e simplicidade. Já a *vista do funcionário* é uma versão mais detalhada, incluindo dados adicionais como o nome do cliente associado à encomenda.

Por fim, o progresso de uma encomenda, referente ao *caso de uso 26*, é apresentado na interface ao clicar na imagem do produto, revelando os detalhes e o estado da encomenda. Tanto clientes como funcionários podem visualizar informações detalhadas, como o identificador, as datas e uma imagem ampliada do produto. O progresso é exibido de forma visual, através de um gráfico ou barra que indica o estado atual (e.g., Processamento, Construção, Entregue). Um botão adicional ("Processo de Montagem") permite acesso a detalhes técnicos ou logísticos.

#figure(
  caption: "Mockup de Listagem de Encomendas",
  kind: image,
  image("images/mockups/ListaEnc1.png", width: 90%)
)

#figure(
  caption: "Mockup de Listagem de Encomendas - Detalhes Adicionais",
  kind: image,
  image("images/mockups/ListaEnc2.png", width: 90%)
)

#figure(
  caption: "Mockup de Listagem das Encomendas do Cliente",
  kind: image,
  image("images/mockups/EncCliente.png", width: 90%)
)


=== Visualização do Produto - Gestor, Fornecedor e Funcionário

Este mockup representa a interface associada ao *caso de uso 23 - Visualizar Produto*, que corresponde ao requisito nº 15 - Visualizar Produto, destinada aos *Gestores, Funcionários* e *Fornecedores*. A interface fornece uma visão detalhada e abrangente dos produtos.

Os utilizadores encontram-se autenticados, de modo que podem visualizar o *nome, imagem, preço* e *descrição* do produto, bem como ver o *número de vezes* que o produto foi *encomendado*. Uma funcionalidade crucial disponível é a *visualização do processo de montagem do produto*, permitindo visualizar como é que o produto é construído em cada etapa, essa interface pode ser vista no mockup de 

Estas informações são importantes para apoiar decisões operacionais e estratégicas relacionadas com a produção e logística da empresa.

Temos acesso a esta interface através da seleção de um produto no catálogo. Esta disposição foi pensada para ser funcional, permitindo uma rápida navegação. 

#figure(
  caption: "Mockup de Visualização do Produto - Gestor",
  kind: image,
  image("images/mockups/VerProdGes.png", width: 90%)
)

#figure(
  caption: "Mockup de Visualização do Produto - Fornecedor e Trabalhador",
  kind: image,
  image("images/mockups/VerProdFT.png", width: 90%)
)

=== Visualização do Produto - Cliente

*Cliente sem sessão iniciada:*

Este mockup apresenta a interface para o *caso de uso 24 - Visualizar Produto*, que corresponde ao requisito nº 15 - Visualizar Produto, destinado a clientes sem sessão iniciada. Nesta interface, o cliente tem acesso a uma apresentação básica e acessível aos produtos disponíveis no catálogo.

O cliente pode visualizar o *nome, imagem, preço* e *descrição* do produto. Embora o cliente tenha acesso limitado, pois não tem a sessão iniciada, este também pode visualizar o *processo de montagem do produto*.

Esta funcionalidade destaca a qualidade do produto, incentivando o cliente a explorar mais a plataforma e eventualmente comprar algum produto.

#figure(
  caption: "Mockup de Visualização do Produto (Cliente sem Login)",
  kind: image,
  image("images/mockups/VerProdClienteSL.png", width: 90%)
)

*Cliente com sessão iniciada:*

Tal como na versão não autenticada, o cliente consegue ver as informações relacionadas com o produto, bem como pode visualizar o processo de montagem do produto. Além disso, o cliente pode consultar as suas *encomendas*.

A inclusão do processo de montagem fornece uma experiência interativa, aumentando o envolvimento do cliente com a plataforma e promove transparência em relação à produção dos itens.

#figure(
  caption: "Mockup de Visualização do Produto (Cliente com Login)",
  kind: image,
  image("images/mockups/VerProdClienteCL.png", width: 90%)
)


=== Iniciar sessão

Este mockup representa a interface correspondente ao *caso de uso 11 - Iniciar Sessão*, associado ao requisito funcional nº 17 - Iniciar sessão.

Este mockup foi pensado para permitir que os utilizadores - Cliente, Gestor, Funcionário e Fornecedor - acedam ao sistema de forma segura e intuitiva.

De modo que, a interface apresente um layout simples, onde o utilizador insere as suas credenciais (nome e palavra-passe) de forma clara. Após o utilizador inserir as suas informações, clica no botão “Log-in” e o sistema valida as suas credenciais.

A página inicial apresenta um design moderno, simples e funcional, o que reflete a importância de ser uma autenticação direta e sem distrações.

#figure(
  caption: "Mockup de Iniciar Sessão",
  kind: image,
  image("images/mockups/Login.png", width: 90%)
)

= Implementação da Aplicação

/*>>> Descrição detalhada do processo de implementação realizado, referindo as opções de desenvolvimento que foram adotadas e as decisões tomadas. Apresentação da estrutura da aplicação desenvolvida e de cada um dos seus serviços, ilustrando um ou dois processos que tenham sido implementados. Reportar o desempenho da aplicação e, em particular, de cada um dos serviços implementados.

=== Requisitos Não Funcionais: Ver como justificar isto

- Requisitos de Produto:
    - O sistema deverá garantir que as páginas sejam carregadas em no máximo 5 segundos em condições normais de rede.
    - O sistema deve ser intuitivo e de fácil utilização.
    - O sistema deve ser capaz de suportar inúmeros clientes em simultâneo.
    - O sistema deverá ser responsivo, adaptando-se a diferentes dispositivos como smartphones, tablets e desktops.
- Requisitos Organizacionais:
    - O sistema precisará de realizar backups automáticos diários dos dados, com a capacidade de restaurar os dados até 7 dias anteriores.
    - O sistema deverá estar preparado para ser atualizado sem necessidade de longos períodos de inatividade.
    - O sistema tem um período definido entre as 3 am e as 5 am da manhã para entrar em  estado de manutenção.
- Requisitos Externos:
    - O sistema terá de ser compatível, pelo menos, com os navegadores mais utilizados: Google Chrome, Safari, Microsoft Edge e Firefox.
    - O sistema deverá ser compatível com as normas de proteção de dados pessoais (GDPR).
- Requisitos de Desenvolvimento:
    - O sistema deverá ser entregue com a documentação básica do código-fonte, de modo a facilitar o processo de manutenção e futuras alterações.
*/

== Apresentação e descrição do processo de implementação realizado
/*>>> Descrição detalhada do processo de implementação realizado, referindo as opções de desenvolvimento que foram adotadas e as decisões tomadas.
*/

A implementação da aplicação seguiu um processo estruturado e metódico, baseado numa abordagem iterativa e incremental, conhecida como "_divide and conquer_". A estratégia consistiu em dividir o desenvolvimneto em fases bem definidas pela equipa de desenvolvedores de _software_, o que permitiu o avanço progressivo, a validação contínua e a integração das funcionalidades de forma coordenada e cooperativa.

O trabalho inicial focou-se na configuração da base do projeto utilizando `.NET` para o _frontend_ e o _backend_, e a criação da base de dados em `SQL Server`. Nesta fase, partimos do modelo lógico definido na fase 4 - Conceção do Sistema de Dados, que foi traduzido para um modelo físico no ficheiro `Valhala.sql`. Além disso, o ficheiro `Povoamento.sql` foi utilizado para inserir os dados da empresa Valhala, de modo a ser possível testar as funcionalidades ao longo do desenvolvimento e apresentar o produto final completo.

A arquitetura da aplicação foi desenhada com uma clara separação de responsabilidades, dividindo-a nas seguintes camadas:

- _Authentication_: Implementação dos processos de autenticação de gestão de sessões.
- _Controller_: Lógica de negócio e gestão de dados.
- _Components_: Gestão de componentes de interface e estrutura do _frontend_.
- _Resources_: Armazenamento da informação da base de dados.

Após a criação da estrutura da aplicação, procedeu-se a implementação dos requisitos. Cada requisito foi tratado como uma unidade de trabalho independente, seguindo o seguinte ciclo:
1. Desenvolvimento da lógica para suporte da funcionalidade.
2. Criação da interface correspondente, garantindo a integração com o _backend_.
3. Testes individuais para cada requisito.

== Apresentação da aplicação e explicação dos serviços implementados - Cada um escreve os que fez

/*>>> Apresentação da estrutura da aplicação desenvolvida e de cada um dos seus serviços, ilustrando um ou dois processos que tenham sido implementados.*/

A aplicação desenvolvida é uma solução integrada para gestão de processos de montagem, encomendas e _stock_, com funcionalidades personalizadas para diferentes tipos de utilizadores: gestores, funcionários, clientes e fornecedores. Apresenta uma interface intuitiva, acessível a partir de diferentes dispositivos, e uma arquitetura robusta, que suporta tanto operações internas quanto integração com sistemas externos.

=== Verificação de stock de peças - Lobo Done

A *verificação de stock de peças* é uma funcionalidade essencial para assegurar o controlo e a disponibilidade dos itens na plataforma. Esta tarefa é realizada pelo gestor através da página de gestão de peças, onde todas as peças registadas no sistema são apresentadas de forma organizada numa tabela paginada.

A tabela contém diversas colunas relevantes, sendo que uma delas exibe o stock atual de cada peça. Essa disposição facilita a visualização rápida e clara do inventário, permitindo ao gestor identificar facilmente itens com baixo stock ou excesso de unidades, respeitando o *requisito funcional nº 1 -Verificação de stock de peças*.

#figure(
  caption: "Tabela de Peças",
  kind: image,
  image("images/UI/stockpecas.png", width: 90%)
)

=== Registo do processo de montagem - Rita

=== Visualização do processo de montagem - Rita

=== Gestão do catálogo de produtos - Mariana Done

A gestão eficiente do catálogo de produtos é uma função essencial para garantir a organização e atualização contínua dos itens disponíveis na empresa. No contexto da plataforma, o gestor tem um papel fundamental, sendo este responsável por manter o catálogo atualizado, bem como gerir os produtos disponíveis para os utilizadores.

De seguida, é detalhado como o gestor pode realizar essas tarefas de forma intuitiva e eficaz, garantindo a manutenção do catálogo sempre em conformidade com as necessidades do negócio, conforme estabelecido no *requisito funcional nº 4 - Gestão do catálogo de produtos*.

==== Adicionar Produto - M Done

O requisito *Adicionar Produto* desempenha um papel fundamental no sistema ao permitir que gestores adicionem novos produtos à base de dados. Esta funcionalidade foi projetada para ser intuitiva e eficiente, proporcionando um processo passo a passo que organiza a tarefa de forma clara e lógica.

O processo divide-se em três passos principais, que estão diretamente relacionados com a usabilidade e as operações realizadas no sistema:

1. Definição dos Dados do Produto
No primeiro passo, o gestor fornece as informações básicas sobre o produto, como nome, preço, descrição e imagem. A pré-visualização da imagem foi incluída para melhorar a experiência do utilizador, pois oferece uma validação visual antes da submissão.

#figure(
  caption: "Definição dos Dados do Produto",
  kind: image,
  image("images/UI/addprodutopt1.png", width: 90%)
)

2. Associação de Peças ao Produto
No segundo passo, o gestor pode selecionar as peças existentes no sistema e associá-las ao produto em criação. Este processo permite a definição precisa dos materiais necessários para a montagem do produto, de forma a garantir que todas as dependências são registadas.

#figure(
  caption: "Associação de Peças ao Produto",
  kind: image,
  image("images/UI/addprodutopt2.png", width: 90%)
)

3. Configuração da Linha de Montagem
O terceiro passo envolve a configuração das etapas da linha de montagem, incluindo as peças necessárias para cada etapa e as suas quantidades. Esta funcionalidade assegura que o processo de montagem é documentado de forma organizada, permitindo a sua rastreabilidade e otimização.

#figure(
  caption: "Configuração da Linha de Montagem",
  kind: image,
  image("images/UI/addprodutopt3.png", width: 90%)
)

#figure(
  caption: "Configuração da Linha de Montagem",
  kind: image,
  image("images/UI/addprodutopt4.png", width: 90%)
)

4. Finalização

#figure(
  caption: "Adição do Produto concluída",
  kind: image,
  image("images/UI/addprodutopt5.png", width: 90%)
)

==== Remover Produto - M Done

A funcionalidade de remover um produto permite aos gestores eliminarem um produto da plataforma. O objetivo é garantir que os produtos sejam removidos,com o propósuto de manter o catálogo atualizado e em conformidade com os processos da empresa Valhala.

A remoção de um produto envolve a interação clara com o utilizador:

1. Acesso à Página de Detalhes do Produto
Caso o utilizador seja "Gestor" da empresa, é apresentada a opção de eliminar o produto.

2. Confirmação de Eliminação
Após o botão de eliminar produto ser pressionado, aparece uma janela de confirmação, isto permite que o utilizador possa desistir da operação.

3. Execução da Remoção
Caso o utilizador confirme a eliminação do produto, este é removido da base de dados, juntamente com informações que lhe pertencem, ou seja, as etapas de montagem e peças associadas a cada etapa de montagem.

4. Reedirecionamento
Após a remoção do produto, o utilizador é reedirecionado para o catálogo.

#figure(
  caption: "Remover Produto",
  kind: image,
  image("images/UI/eliminarproduto.png", width: 90%)
)

=== Autenticação com o Sistema Externo de Compras - Mariana Done

A autenticação dos clientes é realizada da mesma forma que a dos restantes utilizadores, ou seja, com as credenciais habituais de início de sessão (nome de utilizador e palavra-passe). A diferença é que os clientes que já possuem contas no sistema externo de compras e as suas credenciais são as mesmas utilizadas nesse sistema.

O sistema externo de compras envia a informação necessária para autenticar o cliente na nossa plataforma. Desta forma, o cliente não precisa de criar novas credenciais ou realizar um processo de _login_ separado. Apenas insere as credenciais, como faria normalmente, mas com a garantia de que estas são validamente transmitidas e verificadas com base nas credenciais que já existiam no sistema externo.

Este processo de integração garante uma transição suave para o cliente, mantendo a consistência e segurança dos dados sem a necessidade de um sistema de autenticação duplicado, cumprindo com o *requisito funcional nº 5 - Autenticação com o Sistema Externo de Compras*.

=== Regras de Senha - Mariana Done

O requisito Regras de Senha é uma parte fundamental do sistema, tem como objetivo garantir que as senhas dos utilizadores correspondem a requisitos de complexidade e fortalecem a segurança da plataforma. A funcionalidade exige que a senha tenha, no mínimo, 8 caracteres e contenha uma combinação de pelo menos uma letra maiúscula, uma letra minúscula, um número e um caractere especial.

A validação dessas regras ocorre automaticamente durante o processo de criação do utilizador. Caso a senha não corresponda a algum dos critérios estabelecidos, o sistema informa o utilizador sobre o erro e não permite a conclusão da ação até que a senha esteja em conformidade. Isto cumpre com o *requisito funcional nº 6 - Regras de Senha*. 

#figure(
  caption: "Regras de Senha",
  kind: image,
  image("images/UI/regrasSenha.png", width: 90%)
)

=== Visualização do Catálogo - Dionísio Done - falta imagem e não fazes referência ao requisito que está a ser cumprido

A funcionalidade de *Visualização do Catálogo* foi desenvolvida para oferecer aos utilizadores, sejam eles gestores, clientes entre outros, uma interface clara, interativa e informativa para explorar os produtos disponíveis. A funcionalidade diferencia as experiências de navegação entre utilizadores autenticados e não autenticados. O objetivo é proporcionar uma navegação eficiente e detalhada.

Nesta etapa, os produtos são apresentados em uma listagem geral com as seguintes funcionalidades principais:

Filtros Avançados: Os utilizadores podem filtrar os produtos por categorias, preços, disponibilidade, peças associadas ou outros critérios relevantes.

Visualização Resumida: Cada produto é apresentado com uma miniatura da imagem, nome, preço e um botão para mais detalhes.
Paginação ou Rolagem Infinita: Para melhorar a performance e experiência de navegação, os produtos são carregados em lotes.


=== Visualização das encomendas - Rita

=== Encomendas de peças - Lobo Done

A funcionalidade de *Encomenda de peças*, associada ao *requisito funcional nº 9 - Encomendas de peças*, permite ao gestor realizar pedidos de reposição de forma prática e eficiente, diretamente a partir da tabela de peças na página de gestão.


1. Ao selecionar uma peça na tabela, uma janela é exibida contendo informações detalhadas sobre a peça, como identificador, stock atual e fornecedor. Nesta janela, o gestor tem acesso ao botão Encomendar, representado por um ícone de uma carrinha.

#figure(
  caption: "Janela de peça",
  kind: image,
  image("images/UI/infopeca.png", width: 50%)
)

2. Ao pressionar o botão de encomenda, é aberta uma nova janela para o gestor definir a quantidade de peças a serem encomendadas e confirmar a ação.

#figure(
  caption: "Encomendar Peça",
  kind: image,
  image("images/UI/encomendarpeca.png", width: 50%)
)

Essa abordagem step-by-step torna o processo intuitivo, minimizando erros e agilizando o fluxo de trabalho. Além disso, a funcionalidade foi projetada para oferecer uma experiência clara e eficiente, contribuindo para a reposição de stock de forma alinhada às necessidades operacionais da empresa.

=== Gestão de Encomendas pelo Fornecedor - Lobo



=== Atualização Manual de _Stock_ - Lobo

=== Registo e atualização de peças pelo Fornecedor - Lobo

=== Registo na aplicação dos Novos Fornecedores e Funcionários - Dionísio Done - falta imagem e não fazes referência ao requisito que está a ser cumprido


A funcionalidade de  *Registo na Aplicação de Novos Fornecedores e Funcionários* é essencial para a gestão eficiente de utilizadores no sistema. Esta funcionalidade foi projetada para ser simples e intuitiva, garantindo que as informações necessárias sejam recolhidas de forma clara, ao mesmo tempo que assegura a segurança e a consistência dos dados inseridos.

O processo de registo é realizado preenchendo um formulário que inclui os seguintes campos obrigatórios:

- Nome: Identificação completa do utilizador, garantindo que o sistema armazena corretamente os dados pessoais.

- Palavra-passe e Confirmação de Palavra-passe: Para assegurar a autenticidade e segurança, o utilizador deve definir uma palavra-passe e confirmá-la, reduzindo a possibilidade de erros durante o registo.

- Cargo: Definição da função ou posição do utilizador no sistema, como fornecedor, funcionário, gestor, entre outros. Este campo é crucial para configurar permissões e acessos personalizados.
- ID do Utilizador: Um identificador único atribuído ao utilizador, utilizado para fins de organização, rastreabilidade e integração com outros módulos do sistema.

Esta funcionalidade garante que os novos utilizadores, sejam fornecedores ou funcionários, sejam registados de forma padronizada e segura, permitindo a gestão eficiente de acessos e operações. Além disso, a validação automática dos dados durante o preenchimento do formulário reduz erros, promovendo uma experiência de registo ágil e confiável.

=== Remoção na aplicação dos antigos Fornecedores e Funcionários - Dionísio Done - falta imagem e não fazes referência ao requisito que está a ser cumprido


A funcionalidade de *Remoção na Aplicação dos Antigos Fornecedores e Funcionários* foi desenvolvida para facilitar a gestão do sistema, permitindo que utilizadores desatualizados ou que já não fazem parte da organização sejam removidos de forma rápida e segura.

O processo de remoção requer apenas a introdução de dois campos essenciais:

- ID do Utilizador: Identificador único que garante a seleção exata do utilizador a ser removido. Este campo elimina quaisquer ambiguidades no processo de exclusão.
- Cargo: Definição da função do utilizador no sistema (como fornecedor, funcionário, gestor, etc.), assegurando que as permissões e funções associadas ao cargo são também devidamente atualizadas ou removidas.

Com base nesses dados, o sistema executa a remoção do utilizador, garantindo a integridade da base de dados e a manutenção de um ambiente organizado. Esta funcionalidade é simples, eficiente e segura, contribuindo para uma gestão eficaz dos recursos humanos e fornecedores no sistema.

=== Visualizar Produto - Mariana Done

A gestão eficaz do catálogo de produtos é uma componente essencial para a operação eficiente da empresa, garantindo a disponibilidade, organização e atualização contínua dos produtos para os utilizadores.

De seguida, é detalhado como este processo procede, conforme estabelecido no *requisito funcional nº 15 - Visualizar Produto*.

1. Exibição das Informações Básicas do Produto
São exibidos dados essenciais do produto, como nome, descrição, preço e imagem. Estas informações são apresentadas de forma clara, com destaque para o nome e imagem do produto. Além disso, também é exibido um botão de "Montagem", para que os utilizadores possam aceder de forma intuitiva e rápida ao processo de montagem do produto em questão.

#figure(
  caption: "Visualizar Produto",
  kind: image,
  image("images/UI/verproduto.png", width: 90%)
)

2. Identificador do Produto
Em seguida, o sistema exibe o identificador único do produto. Este identificador é apresentado de forma destacada, com um fundo escuro e texto branco, de modo a facilitar a sua visualização e distingue claramente este dado das outras informações da _interface_.

#figure(
  caption: "Visualizar Produto com sessão iniciada",
  kind: image,
  image("images/UI/verprodutologin.png", width: 90%)
)

3. Informações Adicionais
Para os gestores e funcionários, o sistema permite visualizar o número de encomendas associadas ao produto, fornecendo uma visão mais detalhada sobre o item. Além disso, se o utilizador for um gestor, ele pode aceder a funcionalidade de remoção do produto.


#figure(
  caption: "Visualizar Produto para o Gestor",
  kind: image,
  image("images/UI/verprodutoGestor.png", width: 90%)
)

=== Ordenar catálogo - Lobo Done

A funcionalidade de *Ordenar Catálogo* foi desenvolvida para permitir que os utilizadores organizem os produtos disponíveis de acordo com critérios específicos, como preço, popularidade, nome, entre outros. Esta funcionalidade é essencial para melhorar a experiência do utilizador, permitindo uma navegação mais eficiente e personalizada. Foi especificada no *requisito funcional nº 16 - Ordenar Catálogo*.

1. Botão de Ordenação
O sistema apresenta um botão de ordenação no catálogo, que permite ao utilizador selecionar a opção desejada. O botão é destacado e de fácil acesso, garantindo que o utilizador possa ordenar os produtos de forma rápida e intuitiva.

#figure(
  caption: "Catálogo de produtos",
  kind: image,
  image("images/UI/ordenarcatalogo.png", width: 90%)
)

2. Opções de Ordenação
O sistema oferece várias opções de ordenação, como preço, popularidade, nome, entre outros. O utilizador pode selecionar a opção desejada a partir de um menu suspenso, que exibe as alternativas disponíveis de forma clara e organizada.

#figure(
  caption: "Opções de ordenação de produtos",
  kind: image,
  image("images/UI/opcoesordenar.png", width: 30%)
)

=== Iniciar Sessão - Mariana Done

O requisito *Iniciar Sessão* implementa a funcionalidade que permite aos utilizadores se autenticarem no sistema de forma segura e eficiente. Este processo é essencial para identificar o tipo de utilizador e conceder acesso às funcionalidades e permissões adequadas do perfil.

De seguida, é detalhado como este processo procede, conforme estabelecido no *requisito funcional nº 17 - Iniciar Sessão*.

1. Interação Inicial
É apresentado ao utilizador uma página simples e clara, com destaque no formulário de iniciar sessão. Existe a opção para escolher o tipo de utilizador antes de introduzir as credenciais. Isto garante que o sistema diferencia corretamente os utilizadores.

#figure(
  caption: "Iniciar Sessão - Interação Inicial",
  kind: image,
  image("images/UI/login.png", width: 90%)
)

2. Validação e Autenticação
Antes de validar as credenciais, o sistema verifica se todos os campos foram preenchidos. Caso contrário, é exibida uma mensagem de erro. De seguida, o sistema valida as credenciais e caso estas sejam válidas, o utilizador é autenticado.

3. Gestão de Erros
Caso o utilizador introduza credenciais incorretas ou caso falte alguma informação, é exibida uma mensagem de erro informado do sucedido.

#figure(
  caption: "Iniciar Sessão - Gestão de Erros",
  kind: image,
  image("images/UI/loginErro.png", width: 90%)
)

#figure(
  caption: "Iniciar Sessão - Gestão de Erros (Falta de alguma informação)",
  kind: image,
  image("images/UI/loginFaltaCredenciais.png", width: 90%)
)

4. Redirecionamento
Após a autenticação ser realizada corretamente, o utilizador é redirecionado para a página principal do sistema, onde tem acesso às funcionalidades relacionadas com o seu perfil.


=== Terminar Sessão - Mariana Done

O requisito *Terminar Sessão* permite que o utilizador encerre a sua sessão de forma segura e ordenada, de modo a garantir que o acesso ao sistema é encerrado corretamente. Esta operação está disponível no menu de navegação personalizado a cada tipo de utilizador autenticado.

Conforme estabelecido no *requisito funcional nº 18 - Terminar Sessão*, o utilizador pode sair do sistema e termina o acesso às informações associadas à sua sessão atual.

Como é que o processo se procede:

1. Localização da funcionalidade
A opção de terminar sessão encontra-se na parte inferior do menu de navegação, de modo a proporcionar um fácil acesso ao utilizador.

2. Interação com o utilizador
A opção de "Terminar Sessão" aparece no menu suspenso associado ao utiliazdor.

3. Encerramento da sessão
Quando o utilizador clica na opção "Terminar Sessão", a aplicação remove as informações de armazenamento de forma segura, atualiza o estado de autenticação da aplicação e redireciona o utilizador para a página inicial.

#figure(
  caption: "Terminar sessão",
  kind: image,
  image("images/UI/terminarsessao.png", width: 90%)
)


== Análise e avaliação da aplicação desenvolvida

/*>>> Reportar o desempenho da aplicação e, em particular, de cada um dos serviços implementados.*/

Todos os requisitos funcionais foram implementados com base nos seguintes critérios:

1. Simplicidade e Clareza na Interface: A _interface_ foi estruturada em etapas bem definidas, apresenta apenas as informações relevantes em cada momento. O que evita sobrecarga cognitiva e reduz a probabilidade de erros durante o preenchimento.

2. Validação e Prevenção de Erros: Foram implementados mecanismos de validação para assegurar que apenas dados válidos e completos sejam submetidos.

3. Escalabilidade: A abordagem modular adotada permite a expansão futura do sistema, como a adição de novos campos ou validações específicas, sem comprometer a integridade das funcionalidades já existentes.

4. Conectividade entre Camadas: A lógica de _backend_ garante a integração perfeita entre os dados inseridos na _interface_ e as operações da base de dados. Isso assegura que todos os componentes trabalhem em harmonia para atingir os objetivos.

=== Verificação de _stock de peças_ - Lobo

=== Registo do processo de montagem - Rita

=== Visualização do processo de montagem - Rita

=== Gestão do catálogo de produtos - Mariana Done

==== Adicionar Produto - M Done

Esta funcionalidade destaca-se pela sua robustez e flexibilidade, pois permite a gestão eficiente do catálogo de produtos, o que reduz o esforço manual e aumenta a precisão na inserção dos dados.

Adicionalmente, a configuração detalhada das etapas da linha de montagem contribui para a organização do processo produtivo. O fluxo sequencial proporciona uma experiência positiva.

==== Remover Produto - M Done

A funcionalidade de remover produtos oferece benefícios significativos na gestão do catálogo de produtos, pois permite que os gestores mantenham a plataforma constantemente atualizada e organizada. A capacidade de eliminar produtos desatualizados facilita a manutenção de um ambiente dinâmico, onde apenas os itens relevantes estão disponíveis para os utilizadores.

Além disso, a funcionalidade é projetada com segurança e usabilidade em mente. A confirmação antes da sua exclusão evita que os produtos sejam removidos acidentalmente, garantindo que a decisão de remoção seja realizada com cuidado. Apenas os gestores é que têm permissão para realizar esta ação, o que garante o controlo adequado do processo e reduz o risco de erros. A interface intuitiva e a resposta visual claro tornam o processo simples e seguro, proporcionando uma experiência de gestão tranquila e sem complicações.

=== Autenticação com o Sistema Externo de Compras - Mariana Done

A autenticação com o sistema externo de compras foi implementada de forma transparente e eficiente, permitindo que os clientes utilizem as credenciais já existentes no sistema externo para aceder à plataforma. O processo de início de sessão é rápido, sem exigir a criação de novas credenciais, o que simplifica a experiência do utilizador. A integração foi otimizada para garantir baixa latência na validação das credenciais, mantendo a segurança dos dados e proporcionando uma navegação natural e sem interrupções.

=== Regras de Senha - Mariana Done

A aplicação garante uma validação eficiente das senhas e assegura que os utilizadores cumprem com os requisitos de complexidade durante o processo de registo. A verificação ocorre em tempo real, imediatamente após o utilizador inserir a senha, sem causar atrasos perceptíveis na _interface_. O sistema valida se a senha contém pelo menos 8 caracteres, além de exigir uma combinação de letras maiúsculas, minúsculas, números e caracteres especiais. Com isso, a aplicação assegura que os requisitos de segurança são cumpridos, proporcionando uma experiência fluida e sem comprometer o desempenho do sistema.

=== Visualização do Catálogo - Dionísio

Esta funcionalidade destaca-se pela sua robustez e flexibilidade, oferecendo uma interface intuitiva e informativa que possibilita aos utilizadores explorarem o catálogo de produtos de forma eficiente. Ao diferenciar as experiências entre utilizadores autenticados e não autenticados, o sistema garante que cada perfil acede apenas às informações e funcionalidades mais relevantes para as suas necessidades.

O design sequencial desta funcionalidade não só melhora a navegação no catálogo, como também assegura que os dados são apresentados de forma otimizada, sem comprometer o desempenho do sistema. Esta combinação de organização, usabilidade e monitorização demonstra um claro compromisso com a excelência operacional e com a oferta de uma experiência do utilizador superior.

=== Visualização das encomendas - Rita

=== Encomendas de peças - Lobo

=== Gestão de Encomendas pelo Fornecedor - Lobo

=== Atualização Manual de _Stock_ - Lobo

=== Registo e atualização de peças pelo Fornecedor - Lobo

=== Registo na aplicação dos Novos Fornecedores e Funcionários - Dionísio

Esta funcionalidade é essencial para o registo eficiente e seguro de novos fornecedores e funcionários, simplificando o processo de inserção de dados e garantindo a precisão no sistema. A estrutura clara e a validação dos campos asseguram que as informações sejam corretamente registradas, proporcionando uma experiência intuitiva e sem erros.

O sistema foi desenvolvido para ser escalável, permitindo futuras expansões sem afetar a integridade das funcionalidades existentes. A integração entre a interface e o backend garante que as operações sejam realizadas de forma fluida e eficiente, refletindo diretamente nas bases de dados.

=== Remoção na aplicação dos antigos Fornecedores e Funcionários - Dionísio

A funcionalidade de remoção de antigos fornecedores e funcionários é projetada para ser simples e eficiente, permitindo a exclusão rápida de utilizadores desnecessários no sistema. A interface clara e a solicitação dos dados essenciais, como ID e cargo, garantem que o processo seja preciso e sem erros.  
O sistema é altamente escalável, permitindo ajustes ou adições futuras sem comprometer a integridade da aplicação. A integração entre a interface e o backend assegura que todas as remoções sejam refletidas de forma consistente e precisa na base de dados, mantendo o desempenho da aplicação.

=== Visualizar produto - Mariana Done

A funcionalidade de visualização de produtos oferece uma interface intuitiva, apresentando informações de forma clara e eficiente. A distinção entre utilizadores autenticados e não autenticados melhora a experiência, proporcionando um acesso personalizado às funcionalidades relevantes. A navegação é fluida e otimizada, sem comprometer o desempenho do sistema.

Do ponto de vista técnico, a aplicação garante um carregamento rápido e eficiente, com imagens otimizadas para uma navegação ágil. Funcionalidades como a visualização do número de encomendas e a possibilidade de eliminar produtos contribuem para uma gestão eficaz do catálogo, refletindo um compromisso com a qualidade e a experiência do utilizador.

=== Ordenar catálogo - Lobo

=== Iniciar Sessão - Mariana Done

Este início de sessão evidencia-se pela sua eficácia e adaptabilidade, proporciona uma experiência segura e personalizada para os seus utilizadores. Com uma interface simplificada e mensagens claras, o sistema facilita o processo de autenticação e assegura que cada utilizador acede apenas às funcionalidades e dados relevantes.

A implementação dá prioridade a eficiência e segurança, pois verifica as credenciais de forma rápida e garante a proteção dos dados. O _design_ do fluxo de _login_ é otimizado para minimizar erros, destaca-se o equilíbrio entre desempenho técnico e experiência do utilizador.

=== Terminar Sessão - Mariana Done

A funcionalidade de "Terminar Sessão" é eficiente e direta, permite aos utilizadores encerrar as suas sessões de forma rápida e segura. A opção encontra-se integrada de forma intuitiva no menu de navegação, ajustando-se a diferentes tipos de utilizador e garante que todos os dados da sessão são removidos de forma adequada, mantendo a proteção das informações do utilizador.

Esta função demonstra um equilíbrio eficaz entre a simplicidade e o desempenho, fornece uma experiência confiável sem comprometer os recursos do sistema. A implementação reflete uma atenção à segurança e à usabilidade, de modo a consolidar esta funcionalidade como um elemento essencial na experiência global da aplicação.

= Conclusões e Trabalho Futuro

>>> Breve abordagem crítica a TODO o trabalho realizado (parte 1 e parte 2), referindo aspetos positivos e negativos que acharem dignos de realce, acompanhada, quando necessário, com a exposição de algumas linhas de orientação para trabalho futuro com vista à correção ou melhoramento de tudo aquilo que foi realizado nesta primeira parte do trabalho. 

Concluímos a primeira fase do desenvolvimento do sistema, que incluiu o levantamento de requisitos, realização de casos de usos, modelação lógica e a criação de _mockups_. Durante esta etapa, foi garantida a normalização dos dados e a estruturação de um modelo lógico robusto, bem como o desenvolvimento de interfaces intuitivas.

Os próximos passos consistem na preparação e implementação do sistema, incluindo a criação do esquema físico da base de dados, o desenvolvimento da aplicação e a realização de testes para assegurar a sua funcionalidade e conformidade com os requisitos levantados.

#heading(numbering: none)[Referências]

+ Kessler, J. (2022, setembro). Relax. Obtido de https://dbis-uibk.github.io/relax/landing

+ MySQL (s.d.). Documentação SQL. Obtido de https://dev.mysql.com/doc/

+ MySQL. (s.d.). MySQL Workbench. Obtido de https://www.mysql.com/products/workbench/

+ Sommerville, I. (2006). Software Engineering, 9th Edition, Pearson Education, 2010.Jay Hilyard, Stephen Teilhet, C\# Cookbook, 2nd Edition (Cookbooks (O'Reilly)), O'Reilly Media, Inc., 2nd edition, 2006. Obtido de https://engineering.futureuniversity.com/BOOKS%20FOR%20IT/Software-Engineering-9th-Edition-by-Ian-Sommerville.pdf

+ Visual Paradigm. (s.d.). Visual Paradigm. Obtido de https://www.visual-paradigm.com/

+ IKEA. (s.d.). IKEA. Obtido de https://www.ikea.com/pt/pt/



#heading(numbering: none)[Lista de Siglas e Acrónimos]

/ BD: Base de Dados
/ VHL: Valhala

#heading(numbering: none)[Anexos]
