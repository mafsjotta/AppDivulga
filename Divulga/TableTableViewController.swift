//
//  TableTableViewController.swift
//  Divulga
//
//  Created by Mafalda Garcia on 20/05/16.
//  Copyright © 2016 LID. All rights reserved.
//

import UIKit

class TableTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var events = [Event]()
    
    let searchController = UISearchController(searchResultsController: nil)
    var detailViewController: FirstViewController? = nil
    var filteredEvents = [Event]()
    //var filemanager = DatabaseManager()
    let defaults = NSUserDefaults.standardUserDefaults()
    //
    // let event1= Event(name: String, insc:Int32, org: String, details:String,imagelink: String,link: String, date: String, dateEnd: String, topic:String, level: Int32 )!
    //
    
    
     func loadSampleEvents() {
     
        
        let event1 = Event(name:"PYFF6" ,insc:0 ,org:"IST" ,details:"Na sequência de edições anteriores, o 6º congresso internacional em Fisiologia de Leveduras e Fungos Filamentosos (PYFF6- 6th Conference on Physiology of Yeast and Filamentous Fungi) realizar-se-á este ano no Centro de Congressos do Instituto Superior Técnico, Universidade de Lisboa, entre os dias 11 e 14 de julho de 2016.\n Este evento reunirá um vasto leque de investigadores dedicados ao estudo e Ã  exploração de leveduras e fungos filamentosos nas vertentes da biotecnologia, industria e saúde, sob os auspícios da Secção de Fisiologia Microbiana da EFB (European Federation of Biotechnology), e com o apoio da FEMS (Federation of European Microbiological Societies). Este encontro é uma importante plataforma para todos os que trabalham nesta vasta área cientí­fica e uma oportunidade para jovens investigadores apresentarem e discutirem o seu trabalho, bem como ampliarem a sua rede de colaborações, tão importante para o desenvolvimento de trabalho interdisciplinar de relevância. " ,imagelink:"https://fenix.tecnico.ulisboa.pt/downloadFile/563568428731578/top_banner_ULIsboa.jpg" ,link:"http://tecnico.ulisboa.pt/pt/eventos/2016/2/PYFF6___6_Congresso_de_Fisiologia_de_Leveduras_e_Fungos_Filamentosos" ,date:"11-07-2016 09:00" ,dateEnd:"14-07-2016 20:00" ,topic:"Biology" ,level: 4)!
        
        let event2 = Event(name:"INESC-ID Distinguished Lecture Series" ,insc:0 ,org:"IST, INESC-ID" ,details:"No âmbito das INESC-ID Distinguished Lecture Series, irá realizar-se, no dia 27 de junho, pelas 14h30, uma palestra por Pedro Domingos (University of Washington), com o tema \"The Five Tribes of Machine Learning, and What You Can Take from Each\"." ,imagelink:"http://web.tecnico.ulisboa.pt/franciscocsantos/imgs/ist.jpg" ,link:"http://tecnico.ulisboa.pt/pt/eventos/2016/5/INESC_ID_Distinguished_Lecture_Series___Pedro_Domingos" ,date:"27-06-2016 14:30" ,dateEnd:"27-06-2016 15:30" ,topic:"Programming" ,level: 4)!
        
        let event3 = Event(name:"Solos superficiais das ilhas vulcânicas de Santiago, Fogo e Brava" ,insc:0 ,org:"IST - CTN" ,details:"Realiza-se, entre 18 de março e 21 de julho, o Ciclo de seminários Primavera/VerÃ£o 2016 do Centro de CiÃªncias e Tecnologias Nucleares (C2TN) do IST." ,imagelink:"http://web.tecnico.ulisboa.pt/franciscocsantos/imgs/ist.jpg" ,link:"http://tecnico.ulisboa.pt/pt/eventos/2016/3/Ciclo_de_seminarios_Primaveraerao_2016_C2TN" ,date:"23-06-2016 11:00" ,dateEnd:"23-06-2016 12:00" ,topic:"Chemistry" ,level: 4)!
        
        let event4 = Event(name:"2ª UT Austin|Portugal Summer School" ,insc:1 ,org:"IST" ,details:"We invite doctoral and senior undergraduate/master's students to participate in the Portugal | UT Austin Summer School in systems and networking, which is co-located with the spring event for the Erasmus Mundus Joint Doctorate in Distributed Computing. The school will consist of two days of lectures by renowned researchers on selected topics in the broad area of systems and networking. In addition, students will have the opportunity to present a poster about their research and ample time to engage in discussion with all the participants.\n The summer school will take place in Costa da Caparica, a beach located a few kilometers south of Lisbon, easily reachable by taxi from the Lisbon airport.\n Students interested in participating in the summer school should send a short cv and a 1-page abstract of the research problem they are either working on or interested in addressing to summerschool16@gsd.inesc-id.pt.\n Application deadline (round 1): May 6, 2016 (3pm CEST). After this deadline, applications will be accepted only if there is space available." ,imagelink:"http://www.gsd.inesc-id.pt/~ut-austin-pt-emjd-dc-school/logo-ut.gif" ,link:"http://www.gsd.inesc-id.pt/~ut-austin-pt-emjd-dc-school/" ,date:"01-06-2016 10:00" ,dateEnd:"03-06-2016 19:00" ,topic:"Programming",level: 5)!
        
        let event5 = Event(name:"Lisbon Machine Learning School" ,insc:0 ,org:"IST" ,details:"LxMLS 2016 will take place July 21-28 at Instituto Superior Técnico (IST), a leading Engineering and Science school in Portugal. It is organized jointly by IST, the Instituto de TelecomunicaÃ§Ãµes and the Instituto de Engenharia de Sistemas e Computadores, InvestigaÃ§Ã£o e Desenvolvimento em Lisboa (INESC-ID). Click here for information about past editions (LxMLS 2011, LxMLS 2012, LxMLS 2013, LxMLS 2014, LxMLS 2015) and to watch the videos of the lectures (2011, 2012, 2013, 2014).\n The school covers a range of machine learning (ML) Topics, from theory to practice, that are important in solving natural language processing (NLP) problems that arise in the analysis and use of Web data." ,imagelink:"http://lxmls.it.pt/2016/wp-content/uploads/2016/02/copy-01-Banner-LxMLS-2016-04.jpg" ,link:"http://lxmls.it.pt/2016/" ,date:"21-07-2016 08:00" ,dateEnd:"28-07-2016 20:00" ,topic:"Programming" ,level: 4)!
        
        let event6 = Event(name:"Seminários CEMAT-Ciências" ,insc:0 ,org:"FCUL" ,details:"A Munn tree type representation for the bifree locally inverse semigroup." ,imagelink:"https://ciencias.ulisboa.pt/sites/default/files/Ciencias_Logo_Azul-02.png" ,link:"https://ciencias.ulisboa.pt/pt/evento/30-05-2016/semin%C3%A1rios-cemat-ci%C3%AAncias" ,date:"30-05-2016 15:30" ,dateEnd:"30-05-2016 17:30" ,topic:"Mathematics" ,level: 4)!
        
        let event7 = Event(name:"Mapping the geometry of the dark universe" ,insc:0 ,org:"FCUL / IACE" ,details: "Euclid Consortium Meeting 2016 \n Euclid is a space mission designed to map the geometry of the dark Universe. Its primary objectives are the study of dark energy, dark matter, modified gravity and cosmic initial conditions. The Euclid Consortium is a European organization that brings together all laboratories contributing to the Euclid mission, beside ESA. It comprises more than 100 laboratories from 14 European countries and it also includes several US laboratories." ,imagelink:"https://ciencias.ulisboa.pt/sites/default/files/Ciencias_Logo_Azul-02.png" ,link:"https://ciencias.ulisboa.pt/pt/evento/30-05-2016/euclid-consortium-meeting-2016-mapping-geometry-dark-universe" ,date:"30-05-2016 09:30" ,dateEnd:"03-06-2016 20:00" ,topic:"Astronomy" ,level: 4)!
        
        let event8 = Event(name:"FCUL Rally Pro 2016" ,insc:1 ,org:"FCUL" ,details:"O FCUL Rally Pro é um concurso de programação dirigido aos alunos do secundário, visando promover a prática e o gosto pela programação.\n O concurso está organizado como um rally: a resolução de um problema fornece pistas para o próximo problema! Iremos utilizar o Blockly, um editor visual que é executado através do browser. O Blockly foi criado para o ensino da programação e é um projeto gratuito da Google. As inscrições decorrem até dia 25 de maio de 2016." ,imagelink:"https://ciencias.ulisboa.pt/sites/default/files/styles/destaque/public/destaque-fcul-rally-pro-2016.jpg?itok=dkErAHOq" ,link:"https://ciencias.ulisboa.pt/pt/evento/01-06-2016/fcul-rally-pro-2016" ,date:"01-06-2016 08:00" ,dateEnd:"01-06-2016 12:00" ,topic:"Programming" ,level: 3)!
        
        let event9 = Event(name:"Equilibrium and Euler-Lagrange equation for hyperelastic materials" ,insc:0 ,org:"FCUL" ,details: "Elvira Zappale - Universidade de Salerno \n Abstract: By means of duality we prove existence and uniqueness of equilibrium for energies described by integral functionals which fail to be convex. This analysis is motivated by some physical models of elastic materials (cf. for istance [2, 4]) and the techniques generalize the methods first introduced in [5, 1]. A suitable Euler Lagrange equation characterizing the minimizers is derived.\n Joint work with G. Carita and G. Pisante" ,imagelink:"https://ciencias.ulisboa.pt/sites/default/files/Ciencias_Logo_Azul-02.png" ,link:"https://ciencias.ulisboa.pt/pt/evento/02-06-2016/equilibrium-and-euler-lagrange-equation-hyperelastic-materials" ,date:"02-06-2016 13:30" ,dateEnd:"02-06-2016 14:30" ,topic:"Physics" ,level: 4)!
        
        let event10 = Event(name:"Deep Eutectic Solvents" ,insc:0 ,org:"FCUL" ,details:"Sustainable technologies applied to energy-related applications should develop a pivotal role in the next decades. In particular, carbon dioxide capture from flue gases emitted by fossil-fueled power plants should play a pivotal role in controlling and reducing the greenhouse effect. Therefore, the development of new materials for carbon capture purposes has merged as central research line, for which many alternatives have been proposed. Ionic liquids (ILs) have emerged as one of the most promising choices for carbon capture, but in spite of their promising properties, some serious drawbacks have also appeared. Deep eutectic solvents (DESs) have recently been considered as alternatives to ILs that maintain most of their relevant properties, such as task-specific character, and at the same time avoid some of their problems, mainly from economic and environmental viewpoints. DES production from low-cost and natural sources, together with their almost null toxicity and total biodegradability, makes these solvents a suitable platform for developing gas separation agents within the green chemistry framework. Therefore, because of the promising characteristics of DESs as CO2 absorbents and in general as gas separating agents, the state of the art on physicochemical properties of DESs in relationship to their influence on gas separation mechanisms and on the studies of gas solubility in DESs are discussed. The objective of this review work is to analyze the current knowledge on gas separation using DESs, comparing the capturing abilities and properties of DESs with those of ILs, inferring the weaknesses and strengths of DESs, and proposing future research directions on this subject." ,imagelink:"https://ciencias.ulisboa.pt/sites/default/files/fcul/eventos/cqb-02jun16.PNG" ,link:"https://ciencias.ulisboa.pt/pt/evento/02-06-2016/deep-eutectic-solvents-des-preparation-structure-and-physico-chemical-properties" ,date:"02-06-2016 10:30" ,dateEnd:"02-06-2016 11:30" ,topic:"Chemistry" ,level: 4)!
        
        let event11 = Event(name:"Provas de Agregação em História e Filosofia das Ciências" ,insc:0 ,org:"FCUL" ,details:"As provas, requeridas por Ricardo José Lopes Coelho, decorrem nos dias 06 e 07 de junho de 2016." ,imagelink:"https://ciencias.ulisboa.pt/sites/default/files/Ciencias_Logo_Azul-02.png" ,link:"https://ciencias.ulisboa.pt/pt/evento/06-06-2016/provas-de-agrega%C3%A7%C3%A3o-em-hist%C3%B3ria-e-filosofia-das-ci%C3%AAncias" ,date:"06-06-2016 14:30" ,dateEnd:"07-06-2016 15:30" ,topic:"General" ,level: 4)!
        
        let event12 = Event(name:"Iberian Meeting on Algebraic Analysis" ,insc:1 ,org:"FCUL" ,details:"\n \n" ,imagelink:"https://ciencias.ulisboa.pt/sites/default/files/fcul/eventos/iberian-meeting-algebraic-analysis.jpg" ,link:"https://ciencias.ulisboa.pt/pt/evento/08-06-2016/iberian-meeting-algebraic-analysis" ,date:"08-06-2016 09:30" ,dateEnd:"10-06-2016 18:20" ,topic:"Mathematics" ,level: 4)!
        
        let event13 = Event(name:"Escola de Verão de Energia" ,insc:1 ,org:"FCUL" ,details:"Imagina que era possÃ­vel experimentar um curso universitário antes de concorreres ao ensino superior." ,imagelink:"https://ciencias.ulisboa.pt/sites/default/files/styles/destaque/public/destaque-escola-verao-energia-v2.jpg?itok=pwKs4XnO" ,link:"https://ciencias.ulisboa.pt/pt/evento/27-06-2016/escola-de-ver%C3%A3o-de-energia" ,date:"27-06-2016 10:00" ,dateEnd:"01-07-2016 16:00" ,topic:"General" ,level: 3)!
        
        let event14 = Event(name:"Do Planeta para a sala de aula" ,insc:1 ,org:"FCUL" ,details:"Do Planeta para a sala de aula: viagem do laboratório ao campo \n Evento direccionado a professores do Ensino Secundário. \n Candidaturas online de 16 a 30 de maio de 2016." ,imagelink:"https://ciencias.ulisboa.pt/sites/default/files/styles/destaque/public/destaque-acoes-formacao-geologia-jun-2016.jpg?itok=Umc36FdT" ,link:"https://ciencias.ulisboa.pt/pt/evento/28-06-2016/do-planeta-para-sala-de-aula-viagem-do-laborat%C3%B3rio-ao-campo" ,date:"28-06-2016 08:00" ,dateEnd:"01-07-2016 18:00" ,topic:"General" ,level: 5)!
        
        let event15 = Event(name:"Practical Course on Phylogeography" ,insc:1 ,org:"FCUL" ,details:"No seguimento de anteriores iniciativas, o Centro de Ecologia, Evolução e Alterações Ambientais (cE3c) está a organizar diversos Cursos Avançados para oferta no ano letivo 2015/2016.\n Chamamos a atenção para a relevância destes cursos na formação avançada dos estudantes a realizar o 1.º ano dos programas doutorais em Biologia (FCUL), Biodiversidade, Genética e Evolução (BIODIV; ULisboa e UP), e Biologia e Ecologia das Alterações Globais (BEAG; ULisboa e UA), para os quais eles são gratuitos. Estes Cursos poderÃ£o ainda ser frequentados por estudantes pós-graduados inscritos noutros programas doutorais ou mestrados na Ã¡rea da Biologia, ou outros interessados com formação básica adequada (e.g. 1.º ciclo em Biologia ou áreas afins).\n Os cursos têm em geral formato intensivo, com duração de uma semana, sendo reconhecidos para o 1.º ano dos programas doutorais de estudantes da FCUL (5-6 ECTs)." ,imagelink:"https://ciencias.ulisboa.pt/sites/default/files/Ciencias_Logo_Azul-02.png" ,link:"https://ciencias.ulisboa.pt/pt/evento/04-07-2016/practical-course-phylogeography" ,date:"11-06-2016 09:00" ,dateEnd:"11-06-2016 17:30" , topic:"Biology" ,level: 5)!
        
        let event16 = Event(name:"Portugal Solar Challenge" ,insc:1 ,org:"FCUL" ,details:"O Portugal Solar Challenge é um evento único que consiste numa corrida de veículos eléctricos movidos exclusivamente a energia solar e tem como objetivo específico promover, entre todos os jovens participantes, soluções de mobilidade sustentável, em particular veículos solares de baixo custo.\n Inscrições até 31 de maio de 2016, através de envio de e-mail para psc2016fcul@gmail.com e para solar@fc.ul.pt, incluindo nome da equipa, nome do coordenador, e-mail e número de telemóvel.\n A corrida será no dia 9/7/2016, a partir das 8h30. O dia começa com as verificações técnicas e reconhecimento da pista (até às 10h00), feitas na zona do paddock. Às 10h00 inicia-se a ronda de qualificação, em sistema de match-racing com dois ou três carros em pista em cada corrida. Cada equipa fará várias corridas na fase de qualificação. De seguida disputam-se as semi-finais (duas mangas cada). Prevê-se que o evento termine às 14h00. A final será à  melhor de três corridas." ,imagelink:"https://ciencias.ulisboa.pt/sites/default/files/styles/destaque/public/destaque-portugal-solar-challenge-2016.jpg?itok=NFZGlmiW" ,link:"https://ciencias.ulisboa.pt/pt/evento/09-07-2016/portugal-solar-challenge-2016" ,date:"09-07-2016 08:30" ,dateEnd:"09-07-2016 14:00" ,topic:"General" ,level: 2)!
        
        let event17 = Event(name:"Lichens as a tool for interpretation of environmental changes" ,insc:1 ,org:"FCUL" ,details:"No seguimento de anteriores iniciativas, o Centro de Ecologia, Evolução e Alteracões Ambientais (cE3c) estão a organizar diversos Cursos Avançados para oferta no ano letivo 2015/2016.\n Chamamos a atenção para a relevância destes cursos na formação avançada dos estudantes a realizar o 1.º ano dos programas doutorais em Biologia (FCUL), Biodiversidade, Genética e EvoluÃ§Ã£o (BIODIV; ULisboa e UP), e Biologia e Ecologia das Alterações Globais (BEAG; ULisboa e UA), para os quais eles são gratuitos. Estes Cursos poderão ainda ser frequentados por estudantes pós-graduados inscritos noutros programas doutorais ou mestrados na área da Biologia, ou outros interessados com formação básica adequada (e.g. 1.º ciclo em Biologia ou Ã¡reas afins).\n Os cursos têm em geral formato intensivo, com duração de uma semana, sendo reconhecidos para o 1.º ano dos programas doutorais de estudantes da FCUL (5-6 ECTs)." ,imagelink:"https://ciencias.ulisboa.pt/sites/default/files/Ciencias_Logo_Azul-02.png" ,link:"https://ciencias.ulisboa.pt/pt/evento/11-07-2016/lichens-tool-interpretation-environmental-changes" ,date:"11-07-2016 09:00" ,dateEnd:"18-07-2016 17:30" ,topic:"Biology" ,level: 5)!
        
        
        let event18 = Event(name:"Ser Cientista 2016" ,insc:1 ,org:"FCUL" ,details:"Entre os dias 18 e 22 de julho de 2016 decorrerá a 3ª edição do programa 'Ser Cientista'." ,imagelink:"https://ciencias.ulisboa.pt/sites/default/files/styles/destaque/public/destaque-ser-cientista-2016.jpg?itok=R4a7WcV9" ,link:"https://ciencias.ulisboa.pt/pt/evento/18-07-2016/ser-cientista-2016" ,date:"18-07-2016 10:00" ,dateEnd:"22-07-2016 17:00" ,topic:"General" ,level: 3)!
        
        
        let event19 = Event(name:"Semana do Mar" ,insc:1 ,org:"Pavilhão do Conhecimento" ,details:"Vamos fazer experiências científicas sobre a biodiversidade marinha, a densidade da água, a pesca sustentável e a poluição, identificar espécies marinhas e provar caviar de algas. Durante esta semana entre no nosso Laboratório e descubra como se pode proteger contra a radiação UV, experimente gomas feitas com algas na Cozinha é um Laboratório e leve os miúdos ao Cantinho da Ciência, onde eles podem ser oceanógrafos durante umas horas." ,imagelink:"http://www.pavconhecimento.pt/media/banners/1172_semana-do-mar-pav-interior.png" ,link:"http://www.pavconhecimento.pt/visite-nos/programacao/detalhe.asp?id_obj=3855" ,date:"08-06-2016 11:30" ,dateEnd:"12-06-2016 17:15" ,topic:"Biology" ,level: 1)!
        
        let event20 = Event(name:"Férias com Ciência" ,insc:1 ,org:"Pavilhão do Conhecimento" ,details:"Astronauta por um dia, físico, matemático, geólogo, médico, biólogo. Este Verão, o seu filho vai poder ser tudo o que quiser no Pavilhão do Conhecimento. Nas Férias com Ciência vamos descobrir as profissões ligadas à ciência num programa cheio de actividades experimentais, desafios e muita animação. Treinar como um astronauta e desafiar as leis de Newton, aprender a programar, construir um sismógrafo, cultivar micróbios, aprender a combater vírus e bactérias, vestir a pele de um paleontólogo, identificar a dieta alimentar das aves de rapina e desvendar as provas forenses num cenário de crime são alguns dos desafios." ,imagelink:"http://www.pavconhecimento.pt/media/media/2453_atl.jpg" ,link:"http://www.pavconhecimento.pt/visite-nos/programacao/detalhe.asp?id_obj=3857" ,date:"20-06-2016 09:00" ,dateEnd:"09-07-2016 18:00" ,topic:"General" ,level: 1)!
        
        
        
        let event21 = Event(name:"Debates éticos na Comunicação de Ciência " ,insc:0 ,org:"Pavilhão do Conhecimento" ,details:"O Dia C é um ciclo de conversas sobre ética nas ciências da vida, organizado pela Ciência Viva e pelo Conselho Nacional de ética para as Ciências da Vida (CNECV). Decorre na última quinta-feira de cada mês, das 19:30 às 21:00. Em cada sessão um painel de especialistas apresenta um tema actual e controverso. Segue-se um debate entre os especialistas e o público, com o apoio de um moderador.\n \n Dia 26 de Maio | Debates éticos na Comunicação de Ciência \n A ciência ocupa um papel singular no mundo moderno, tendo impacto em todas as esferas da vida social. é cada vez mais importante a comunicação sobre ciência, a par da reflexão sobre as relações da ciência com os cidadãos.\n O foco desta reflexão tem sido a forma como a comunicação de ciência promove a compreensão, aceitação ou o envolvimento do público; no entanto, esta avaliação não se esgota na qualidade técnica e na eficácia da comunicação. O próximo Dia C trata justamente de outro aspecto que não pode ser negligenciado â€” a forma como deve ser comunicada a ciência, os princí­pios que devem orientar a comunicação de ciência.\n Em debate com o público estarão tópicos como a responsabilidade pela fundamentação das conclusões divulgadas; a precaução perante resultados preliminares, especulações ou afirmações exageradas; a honestidade quanto ao grau de incerteza da investigação; ou a transparência quanto a conflitos de interesses dos cientistas ou comunicadores envolvidos. A quem cabe assegurar o reconhecimento destes valores e o cumprimento destes deveres? De que modo?\n \n \n Oradores: António Granado (FCSH-UNL), António Vaz Carneiro (Centro de Estudos de Medicina Baseados na Evidência - FMUL), João Lobo Antunes (CNECV). \n \n Moderadora: Catarina Ramos (Fundação Champalimaud)" ,imagelink:"http://www.pavconhecimento.pt/media/banners/1165_conversas-etica-ciencias-vida-maio-destaquepav.png" ,link:"http://www.pavconhecimento.pt/visite-nos/programacao/detalhe.asp?id_obj=3866" ,date:"30-06-2016 19:30" ,dateEnd:"30-06-2016 21:00" ,topic:"General" ,level: 3)!
        
        let event22 = Event(name:"European Maker Week" ,insc:1 ,org:"Pavilhão do Conhecimento" ,details:"O Pavilhão do Conhecimento, Ciência Viva associa-se à  European Maker Week. Descubra e brinque com o MaKeyMaKey e o Arduino, aprenda a programar, controle os robõs Dash e Dot, explore a sua imaginação usando os  littleBits ou construa um autómato durante esta semana na Dóing, o nosso espaço tinkering e maker. \n Alinhado com o espí­rito da Maker Faire, esta é uma iniciativa promovida pela Comissão Europeia e implantada pela Maker Faire Rome em colaboração com a Startup Europe, que pretende atrair que pretende dar a conhecer e disseminar a cultura maker nacional, potenciando a troca de experiências e conhecimento na comunidade local. \n \nAtravés da organização de pequenos workshops ou exibição de projectos, este é um espaço de partilha, onde as Escolas, FabLabs, Hackerspaces e outras associações locais são convidadas a participar e envolver a restante comunidade local." ,imagelink:"http://www.pavconhecimento.pt/media/banners/1174_europeanmakerweek-509.png" ,link:"http://www.pavconhecimento.pt/visite-nos/programacao/detalhe.asp?id_obj=3854" ,date:"31-05-2016 10:00" ,dateEnd:"05-06-2016 18:30" ,topic:"Electronics" ,level: 1)!
        
        let event23 = Event(name:"The Liver beyond Surgery in Colorectal Metastasis" ,insc:0 ,org:"Fundação Champalimaud" ,details:"A Fundação Champalimaud irá realizar no dia 18 de Novembro de 2016 um simpósio sobre tratamento de metástases hepáticas de tumores do cólon e reto com ênfase nas modalidades minimamente invasivas.\n O painel de palestrantes inclui especialistas de referência internacional nas diferentes técnicas. \n Esta reunião incidirá assim sobre a ablação percutânea (radiofrequência, micro-ondas), a radioterapia (SBRT) e as técnicas de tratamento intra-arterial regional (radioembolização com Ítrio 90, quimioembolização e quimioinfusão intra-arterial). \n Estes métodos são hoje ferramentas muito úteis na abordagem multidisciplinar da doença, nos diferentes cenários em que esta se manifesta e integrados numa estratégia global de tratamento que se estende desde o intuito curativo e de downstaging, atitude exclusivamente paliativa." ,imagelink:"http://www.fchampalimaud.org/media/uploads/radio.jpg" ,link:"http://www.fchampalimaud.org/pt/newsroom/eventos/the-liver-beyond-surgery-in-colorectal-metastasis-pt-view/?p=1" ,date:"2016-18-11 08:00" ,dateEnd:"18-11-2016 10:00" ,topic:"Biology" ,level: 5)!
        
        let event24 = Event(name:"Circo Matemático" ,insc:1 ,org:"MUHNAC" ,details:"Com cordas, cartas ou dados, um conjunto de artistas mostram como é possível fazer magia recorrendo à  Matemática, a Matemagia. Tão divertido quanto pedagógico, numa aplicação da matemática a ambientes divertidos e descontraí­dos." ,imagelink:"http://www.museus.ulisboa.pt/sites/default/files/circo_matematico.jpg" ,link:"http://www.museus.ulisboa.pt/pt-pt/node/898" ,date:"01-06-2016 10:00" ,dateEnd:"01-06-2016 13:00" ,topic:"Mathematics" ,level: 2)!
        
        let event25 = Event(name:"Hubble: 25 anos de Observações e Descobertas!" ,insc:0 ,org:"MUHNAC" ,details:"Partindo do Espaço Hubble iremos olhar, sob a matriz de um céu estrelado, para um dos mais fascinantes instrumentos usados em Astronomia nos últimos 25 anos." ,imagelink:"http://www.museus.ulisboa.pt/sites/default/files/NEI%20westerlund_site.jpg" ,link:"http://www.museus.ulisboa.pt/pt-pt/node/787" ,date:"04-06-2016 16:30" ,dateEnd:"04-06-2016 18:00" ,topic:"Astronomy" ,level: 2)!
        
        let event26 = Event(name:"Histórias de Estrelas e Planetas!" ,insc:0 ,org:"MUHNAC " ,details:"Histórias que deram origem a constelações. A orientação pelas estrelas com referências às navegações portuguesas. A Lua e os planetas no céu de Portugal." ,imagelink:"http://www.museus.ulisboa.pt/sites/default/files/Historias-de-estrelas-e-planetas_foto_0.jpg" ,link:"http://www.museus.ulisboa.pt/pt-pt/node/1082" ,date:"05-06-2016 16:30" ,dateEnd:"05-06-2016 18:00" ,topic:"Astronomy" ,level: 2)!
        
        let event27 = Event(name:" O céu de Galileu!" ,insc:0 ,org:"MUHNAC " ,details:"Galileu vai mostrar-nos, na primeira pessoa, os astros e as estruturas que observou.\n O que viu? \n Como viu? \n A Via Láctea, a Lua, o Sol, Júpiter, as Pleiades, o Presépio, são alguns exemplos! Mas há mais! \n Atividade destinada ao público geral | Sem marcação prévia \n Preço: 3,50€ ‚¬ / pessoa \n \n Informações: geral@museus.ulisboa.pt | 213 921 808" ,imagelink:"http://www.museus.ulisboa.pt/sites/default/files/Galileu_750x500.jpg" ,link:"http://www.museus.ulisboa.pt/pt-pt/node/816" ,date:"11-06-2016 16:30" ,dateEnd:"11-06-2016 18:00" ,topic:"Astronomy" ,level: 2)!
        
        let event28 = Event(name:" 60 Minutos de Ciência" ,insc:0 ,org:"MUHNAC" ,details:"Poderá um peixe descodificar o segredo da regeneração de órgãos? \n \n Não seria fantástico podermos reparar o nosso coração após um enfarte? Não seria espantoso voltar a andar depois de termos lesionado a nossa espinal medula? Não seria mesmo incrível voltarmos a crescer um dedo depois de uma amputação?  Seria sem dúvida!  Mas o que é extraordinário é que existem seres no nosso planeta que o conseguem fazer assim, sem mais nem menos!!! \n \nMas como??? Esta é a questão que vamos tentar desvendar!!! \n \n Leonor Saúde - IMM/FCUL \n Leonor Saúde lidera um laboratório de investigação no Instituto de Medicina Molecular em Lisboa e é professora convidada de Histologia e Embriologia na Faculdade de Medicina da Universidade de Lisboa." ,imagelink:"http://www.museus.ulisboa.pt/sites/default/files/website_laranja.jpg" ,link:"http://www.museus.ulisboa.pt/pt-pt/node/924" ,date:"16-06-2016 18:45" ,dateEnd:"16-06-2016 19:45" ,topic:"General" ,level: 2)!
        
        let event29 = Event(name:"MUHNAC Cursos" ,insc:1 ,org:"MUHNAC" ,details:"Coleções Científicas como Fontes de Investigação em História\n O MUHNAC oferece uma ampla variedade de cursos destinados a complementar a formação de profissionais de museus, estudantes de diversas áreas e demais interessados na preservação e acessibilidade de coleções e património. A formação tem como foco as coleções científicas e o património cientí­fico." ,imagelink:"http://www.museus.ulisboa.pt/sites/default/files/BAS3_IMG_site.jpg" ,link:"http://www.museus.ulisboa.pt/pt-pt/node/928" ,date:"18-06-2016 09:30" ,dateEnd:"18-06-2016 17:00" ,topic:"General" ,level: 2)!
        
        let event30 = Event(name:"Um mês, um tema, um nome de Ciência" ,insc:0 ,org:"MUHNAC" ,details:"Numa visita dramatizada pelo Jardim Botânico e enquanto nos apresenta algumas das plantas mais carismáticas, esta antiga professora da Faculdade de Ciências de Lisboa contará algumas curiosidades sobre a sua carreira, tendo sido a primeira mulher doutorada em Botânica em Portugal.\n Participe! \n Atividade destinada ao público em geral e famílias com crianças a partir dos 6 anos| Sem marcação prévia \n Preço: 3€ ‚p / pessoa \n Informações: geral@museus.ulisboa.pt | 213 921 808" ,imagelink:"http://www.museus.ulisboa.pt/sites/default/files/site_20.jpg" ,link:"http://www.museus.ulisboa.pt/pt-pt/node/826" ,date:"18-06-2016 15:00" ,dateEnd:"18-06-2016 16:00" ,topic:"Biology" ,level: 2)!
        
        let event31 = Event(name:"A olhar para o céu!" ,insc:0 ,org:"MUHNAC" ,details:"O que estamos a ver quando olhamos para o céu? \n \n Na sessão, partimos do céu visível a olho nu, iremos das estrelas até Ã s galáxias próximas e mais distantes.\n \n Atividade destinada a público em geral e famí­lias | Sem marcação prévia \n Preço: 3,50€‚ p / pessoa \n Informações: geral@museus.ulisboa.pt | 213 921 808" ,imagelink:"http://www.museus.ulisboa.pt/sites/default/files/Planet%C3%A1rio_foto_10.jpg" ,link:"http://www.museus.ulisboa.pt/pt-pt/node/832" ,date:"18-06-2016 16:30" ,dateEnd:"18-06-2016 18:00" ,topic:"Astronomy" ,level: 2)!
        
        let event32 = Event(name:"Clube de Robótica" ,insc:1 ,org:"MUHNAC" ,details:"Organizado pela embaixadora da FIRST LEGO League Portugal, Ana Raquel Silva, o objetivo do clube de robótica é entusiasmar os jovens e crianças para a ciência, tecnologia, engenharia e inovação." ,imagelink:"http://www.museus.ulisboa.pt/sites/default/files/Foto%20rob%C3%B3tica_0.jpg" ,link:"http://www.museus.ulisboa.pt/pt-pt/node/727" ,date:"19-06-2016 10:00" ,dateEnd:"26-06-2016 13:00" ,topic:"Programming, Electronics" ,level: 2)!
        
        let event33 = Event(name:"Do Big-Bang ao observador cósmico - Visita orientada" ,insc:0 ,org:"MUHNAC" ,details:"A sucessão de eventos astronómicos, geológicos e biológicos que antecedem o aparecimento do ser humano... \n Participe! \n Atividade destinada ao público em geral e famí­lias com crianças a partir dos 9 anos. | Sem marcação prévia \n Preço: 3,50€ p/ pessoa \n Informações: geral@museus.ulisboa.pt | 213 921 808" ,imagelink:"http://www.museus.ulisboa.pt/sites/default/files/BigBangObservC%C3%B3smico.jpg" ,link:"http://www.museus.ulisboa.pt/pt-pt/node/838" ,date:"19-06-2016 16:00" ,dateEnd:"19-06-2016 17:30" ,topic:"Astronomy" ,level: 2)!
        
        let event34 = Event(name:"Férias no Museu" ,insc:1 ,org:"MUHNAC" ,details:"O Museu Nacional de História Natural e da Ciência realiza mais uma edição do programa de Férias no Museu - edição verão 2016. \n O título de cada semana é alusivo ao tema do Ano Internacional das Leguminosas declarado pelas Nações Unidas: favas contadas, jogar a feijões, ervilhas tortas e grão-de-bico. Vamos passar a semana de uma forma divertida abordando de uma forma transversal todas as áreas científicas presentes no museu. \n O programa decorrerá nos perí­odos de 20 a 24 de junho, 27 de junho a 1 de julho, 4 a 8 de julho e 11 a 15 de julho. Destina-se a crianças dos 6 aos 12 anos. \n Em cada dia há dois módulos de atividades, um de manhã, das 9h30 às 12h30 e outro à  tarde, das 14h00 às 17h00. \n \n Nota: Haverá um perí­odo de acolhimento dos participantes (das 8h45 às 9h30) e perí­odo de recolha (das 17h  às 17h45), com ponto de encontro na Avenida das Palmeiras (nº 58 da Rua da Escola Politécnica) \n Programa completo brevemente disponível. \n Preço: \n - 25€‚p/dia; 100€‚p/semana \n- Desconto de 10% na inscrição do segundo filho; \n- Desconto de 10% para filhos dos colaboradores da Companhia de Seguros Lusitânia; \n- Descontos não acumuláveis; \n - O pagamento deverá ser efetuado, após a confirmação da inscrição, na receção do Museu, em dias úteis, das 10h às 17h, ou por transferência bancária. \n- A inscrição só está concluí­da após o pagamento. \n \n Mais informações e inscrições: \n geral@museus.ulisboa.pt | 213 921 808" ,imagelink:"http://www.museus.ulisboa.pt/sites/default/files/IMG_3794_site.jpg" ,link:"http://www.museus.ulisboa.pt/pt-pt/node/1095" ,date:"20-06-2016 09:30" ,dateEnd:"15-07-2016 17:00" ,topic:"General" ,level: 1)!
        
        let event35 = Event(name:"MUHNAC Cursos" ,insc:1 ,org:"MUHNAC, PRISC" ,details:"MUHNAC Cursos | Coleções de Entomologia \n O MUHNAC oferece uma ampla variedade de cursos destinados a complementar a formação de profissionais de museus, estudantes de diversas áreas e demais interessados na preservação e acessibilidade de coleções e património. A formação tem como foco as coleções científicas e o património científico. \n Conheça o programa completo dos Cursos MUHNAC aqui. \n ADV8. Coleções de Entomologia \n Introdução à  gestão de coleções entomológicas. Amostragem e preparação de espécimes, catalogação e gestão da base de dados, captura de imagem e determinação taxonómica. Condições ambientais em reservas entomológicas. \n Docentes: Luís Filipe Lopes \n Tipo: Workshop + saída de campo \n Duração: 18h \nIdioma: Português \n Preço: Consulte aqui (modalidade C) \n Número máximo de participantes: 16 \n Data limite para inscrição: 3 de junho \nPara se inscrever preencha o formulário e envie para geral@museus.ulisboa.pt" ,imagelink:"http://www.museus.ulisboa.pt/sites/default/files/imagem_principal_site_0.jpg" ,link:"http://www.museus.ulisboa.pt/pt-pt/node/1010" ,date:"20-06-2016 10:00" ,dateEnd:"22-06-2016 17:00" ,topic:"General" ,level: 2)!
        
        let event36 = Event(name:"MUHNAC Cursos | Preservação de Coleções em Meio Líquido" ,insc:1 ,org:"MUHNAC, PRISC" ,details:"MUHNAC Cursos | Preservação de Coleções em Meio Líquido \n O MUHNAC oferece uma ampla variedade de cursos destinados a complementar a formação de profissionais de museus, estudantes de diversas áreas e demais interessados na preservação e acessibilidade de coleções e património. A formação tem como foco as coleções científicas e o património científico." ,imagelink:"http://www.museus.ulisboa.pt/sites/default/files/imagem_principal_site_0.jpg" ,link:"http://www.museus.ulisboa.pt/pt-pt/node/1011" ,date:"20-06-2016 10:00" ,dateEnd:"24-06-2016 17:00" ,topic:"General" ,level: 2)!
        
        
        let event37 = Event(name:" Visita ao Observatório Astronómico de Lisboa" ,insc:1 ,org:"MUHNAC, OAL" ,details:"O Observatório Astronómico de Lisboa é um dos mais interessantes, da Europa, do séc. XIX. \n O seu carismático Diretor, Campos Rodrigues, realizou trabalho científico amplamente reconhecido na sua época. \n Iremos conhecer esta e outras histórias! \n \n Destina-se a público geral e famílias com crianças a partir dos 6 anos \n Atividade gratuita (Estacionamento condicionado ao pagamento de 1,50€) \n Inscrição prévia obrigatória, até 48h antes da sua realização. \n Sujeita a número mínimo de participantes. \n Informações e marcações: geral@museus.ulisboa.pt | 213 921 808" ,imagelink:"http://www.museus.ulisboa.pt/sites/default/files/Campos%20Rodrigues_SEAC.jpg" ,link:"http://www.museus.ulisboa.pt/pt-pt/node/856" ,date:"25-06-2016 11:00" ,dateEnd:"25-06-2016 12:30" ,topic:"Astronomy" ,level: 2)!
        
        let event38 = Event(name:"Rota das simetrias" ,insc:0 ,org:"MUHNAC" ,details:"Passeio em torno da Calçada Portuguesa de Lisboa, desde o Jardim Botânico até à Praça do Município. \n Venha descobrir a matemática da rua, desvendar os seus segredos e conhecer a sua história. \n \n FINS DE SEMANA MATEMÁTICOS \n Com a missão de aproximar as ciências matemáticas do grande público, o MUHNAC, o projeto Matemática do Planeta Terra e a Associação Ludus dedicam o quarto sábado de cada mês ao lado mais recreativo da matemática num programa anual de atividades que promete mostrar-lhe a matemática como nunca a viu. \n \n Atividade destinada ao público em geral e famílias com crianças a partir dos 6 anos \n \n Sem marcação prévia \n \n Preço: 3,5€‚ p/ pessoa \n Informações: geral@museus.ulisboa.pt | 213 921 808" ,imagelink:"http://www.museus.ulisboa.pt/sites/default/files/fins%20semana%20matem%C3%A1ticos_0.jpg" ,link:"http://www.museus.ulisboa.pt/pt-pt/node/844" ,date:"25-06-2016 15:00" ,dateEnd:"25-06-2016 16:30" ,topic:"Mathematics" ,level: 2)!
        
        let event39 = Event(name:"Histórias de Estrelas e Planetas!" ,insc:0 ,org:"MUHNAC" ,details:"Histórias que deram origem a constelações. A orientação pelas estrelas com referências às navegações portuguesas. A Lua e os planetas no céu de Portugal." ,imagelink:"http://www.museus.ulisboa.pt/sites/default/files/Historias-de-estrelas-e-planetas_foto_0.jpg" ,link:"http://www.museus.ulisboa.pt/pt-pt/node/850" ,date:"25-06-2016 16:30" ,dateEnd:"25-06-2016 18:00" ,topic:"Astronomy" ,level: 2)!
        
        let event40 = Event(name:"Clube de Robótica" ,insc:1 ,org:"MUHNAC" ,details:"Organizado pela embaixadora da FIRST LEGO League Portugal, Ana Raquel Silva, o objetivo do clube de robótica é entusiasmar os jovens e crianças para a ciência, tecnologia, engenharia e inovação." ,imagelink:"http://www.museus.ulisboa.pt/sites/default/files/Foto%20rob%C3%B3tica_0.jpg" ,link:"http://www.museus.ulisboa.pt/pt-pt/node/728" ,date:"10-07-2016 10:00" ,dateEnd:"10-07-2016 13:00" ,topic:"Electronics" ,level: 2)!
        
        let event41 = Event(name:"Clube de Robótica" ,insc:1 ,org:"MUHNAC",details:"Organizado pela embaixadora da FIRST LEGO League Portugal, Ana Raquel Silva, o objetivo do clube de robótica é entusiasmar os jovens e crianças para a ciência, tecnologia, engenharia e inovação." ,imagelink:"http://www.museus.ulisboa.pt/sites/default/files/Foto%20rob%C3%B3tica_0.jpg" ,link:"http://www.museus.ulisboa.pt/pt-pt/node/728" ,date:"17-07-2016 10:00" ,dateEnd:"17-07-2016 13:00" ,topic:"General" ,level: 2)!
        
        let event42 = Event(name:"Dinossauros que viveram na nossa terra" ,insc:0 ,org:"MUHNAC" ,details:"Como conhecemos a história da Vida na Terra ao longo do tempo? Como eram os ambientes e as faunas da Região Oeste de Portugal há 150 milhões de anos? Estas são algumas das perguntas que a exposição Dinossauros que viveram na nossa Terra pretende responder. \n A exposição está dividida em cinco módulos, cada um dedicado a um membro geológico constituí­do por um conjunto de rochas sedimentares, que representa um intervalo de tempo entre o Jurássico Superior e o Cretácico. Em cada uma destas secções são apresentados alguns dos fósseis encontrados nos diferentes níveis sedimentares que afloram na Região Oeste de Portugal, com especial ênfase no concelho de Torres Vedras. \n A exposição Dinossauros que viveram na nossa terra foi concebida para a comemoração dos 15 anos da Sociedade de História Natural (SHN), e esteve patente no Museu Municipal Leonel Trindade (Torres Vedras) entre novembro de 2012 e setembro de 2014. A SHN, sediada em Torres Vedras, tem a seu cargo uma das maiores coleções paleontológicas de vertebrados do Jurássico Superior de Portugal, fruto de quase duas décadas de intervenções na região Oeste de Portugal. A juntar a este acervo, a SHN e a Câmara Municipal de Torres Vedras acolheram em 2008 uma importante coleção paleontológica privada, reunido por José Joaquim dos Santos e Luís Francisco, dois aficionados da Paleontologia." ,imagelink:"http://www.museus.ulisboa.pt/sites/default/files/Eventosite2.jpg" ,link:"http://www.museus.ulisboa.pt/pt-pt/dinossauros-que-viveram-na-nossa-terra" ,date:"18-05-2016 10:00" ,dateEnd:"18-05-2017 18:00" ,topic:"Biology" ,level: 2)!
        
        let event43 = Event(name: "Variability and adaptation in neurons and circuits" ,insc:1 ,org:"FMUC" ,details:"This one-day neuroscience symposium on Variability and adaptation in neurons and circuits will be held on the 1st of June 2016, at the Faculty of Medicine, Health Sciences Campus, University of Coimbra, Portugal (Auditorium 2, subunit 1), just before the 7th ISN Special Neurochemistry Conference on Synaptic function and dysfunction in brain diseases." ,imagelink:"http://www.uc.pt/en/fmuc/pf2muc/SymposiaWorkshops/6thCNC.IBILI.Symposium/symposium_logo" ,link:"http://www.uc.pt/en/fmuc/pf2muc/SymposiaWorkshops/6thCNC.IBILI.Symposium" ,date:"01-06-2016 09:00" ,dateEnd:"01-06-2016 17:00" ,topic:"Medicine" ,level: 4)!
        
        let event44 = Event(name:"Seminário de Análise Numérica e Optimização" ,insc:0 ,org:"Dep. de Matemática FCTUC" ,details:"Oradora: Magda Rebelo (CMA/UNL)." ,imagelink:"http://www.mat.uc.pt/CMS/media/images/home_01.jpg" ,link:"https://cmuc.mat.uc.pt/rdonweb/event/showPPSeminar.do?seminarID=1472" ,date:"01-06-2016 14:30" ,dateEnd:"01-06-2016 15:30" ,topic:"Mathematics" ,level: 4)!
        
        let event45 = Event(name:"Clash of the Genomes" ,insc:0 ,org:"Clash of the Genomes" ,details:"During the past five years a number of national and regional initiatives have been launched in the hopes of supporting the development of personalised health care research through the collection and analysis of large numbers of genomes from populations. Larger projects, such as the Genomics England Initiative, as well as the launch of the US Precision Medicine Initiative are paralleled by smaller national and regional initiatives within countries like Denmark, Estonia, Faroe Islands and Finland to collect large numbers of samples from the population, sequence them and then leverage them for biomedical research." ,imagelink:"http://www.ces.uc.pt/images/logos-CES-vertical.png" ,link:"http://www.ces.uc.pt/eventos/index.php?id=14046&id_lingua=1" ,date:"22-06-2016 10:00" ,dateEnd:"22-06-2016 11:00" ,topic:"Biology" ,level: 4)!
        
        let event46 = Event(name:"A História das Ciências no Brasil: Caminhos e Perspectivas" ,insc:0 ,org:"Museu da Ciência/UC" ,details:"Conferencista: Gildo Magalhães dos Santos Filho (Universidade de São Paulo, Brasil). \n Ao se tratar da História das Ciências no Brasil, uma primeira indagação é de que ciências estamos a falar. Desde a época da América Portuguesa até os dias atuais, quais são as contribuições científicas e técnicas brasileiras que têm merecido maior atenção por parte dos historiadores? Um outro aspecto é como tem sido levada a cabo a investigação, em termos de fontes e metodologias. Serão apresentados alguns resultados significativos dessa historiografia, que vem se desenvolvendo em termos académicos há cerca de sessenta anos." ,imagelink:"http://www.museudaciencia.org/scripts/showImage.php?iid=1504&sample=4" ,link:"http://www.museudaciencia.org/index.php?module=events&option=&action=&id=642" ,date:"16-06-2016 14:30" ,dateEnd:"16-06-2016 15:30" ,topic:"General" ,level: 2)!
        
        let event47 = Event(name:"Investigar em Saúde no CES: temas e perspetivas" ,insc:0 ,org:"Centro de Estudos Sociais Laboratório Associado Universidade de Coimbra" ,details:" Existe, hoje, um vasto espetro de investigação na área da saúde no âmbito das ciências sociais, o qual tem vindo a privilegiar diferentes abordagens, focando distintos temas e realidades empí­ricas, estratégias e/ou tecnologias e intervenções capazes de auxiliar a resolução de problemas concretos. Integrado no VI Ciclo Ciências Sociais e Saúde, este seminário dá voz a alguns dos projetos de investigação em saúde em curso no Centro de Estudos Sociais da Universidade de Coimbra, tanto ao ní­vel dos doutoramentos como dos pós doutoramentos, uma iniciativa que visa, prioritariamente, estabelecer um diálogo abrangente entre diversos temas em análise, sobretudo aqueles que se constituem como desafios e temas críticos para os sistemas de saúde." ,imagelink:"http://www.ces.uc.pt/images/logos-CES-vertical.png" ,link:"http://www.ces.uc.pt/eventos/index.php?id=13694&id_lingua=1" ,date:"23-06-2016 14:00" ,dateEnd:"23-06-2016 15:00" ,topic:"Medicine" ,level: 4)!
        
       let event48 = Event(name: "Doing Workshop",insc: 1, org:"Pavilhão do Conhecimento",  details: "\n Meet the Maker \n No penúltimo sábado de cada mês, a Dòing recebe um Maker convidado. Entusiastas de tecnologia, artesãos, mecânicos ou cientistas, que vêm partilhar os seus próprios projectos esperando inspirar os seus. Estes workshops destinam-se a jovens e adultos curiosos, amantes do  DIY (do inglês Do-it-Yourself), habilidosos ou profissionais, com interesse em aprender ou desenvolver competências técnicas. \n Das 15.30 às 18.30 | M/14 | 10€ (inclui certificado de participação) | Inscrição on-line",imagelink:"http://www.pavconhecimento.pt/media/objectos/3686_l1_workshops-doing-banner--explorar-criar.png", link:"http://www.pavconhecimento.pt/visite-nos/actividades/detalhe.asp?id_obj=2798",date: "2016-06-04 16:00", dateEnd: "2016-06-04 18:30",topic: "Electronics", level: 1)!
     
        let event49 = Event(name: "Web Summit",insc: 1, org:" ", details:"The most important startup gathering on the planet. Join us to help write our next chapter in Lisbon on November 8-10: https://websummit.net/ . \n \"An extraordinary gathering of talent & energy with one goal: to help entrepreneurs network\" - Wired\n  \"It was a conference that lived up to, and even exceeded, the hype\" - The Wall Street Journal",imagelink:"http://www.hotpress.com/store/images/adm/15/15608/15608397_websummit460.jpg" ,link:"https://websummit.net", date: "2016-11-08 09:00",dateEnd: "2016-11-10 23:00", topic: "Programming", level:3)!
        
       let event50 = Event(name: "A Cozinha é um Laboratório",insc: 1, org:"Pavilhão do Conhecimento", details:"Gomas de fruta\n \n Sabia que as gomas podem ser saudáveis e saborosas? Entre na Cozinha é um Laboratório e descubra como um gelificante extraído de algas nos poderá ajudar a confeccionar coloridas gomas de fruta. \n Famílias com crianças M/6 | 2€ por participante ou gratuito na compra do bilhete de acesso às exposições \n Inscrição on-line* ou no próprio dia na bilheteira",imagelink:"http://www.pavconhecimento.pt/media/objectos/607_l1_icones-ag-inic-04.png" ,link:"http://www.pavconhecimento.pt/visite-nos/actividades/detalhe.asp?id_obj=607", date: "2016-06-12 15:30",dateEnd: "2016-06-12 17:15", topic: "Chemistry", level:1)!
        
        let event51 = Event(name: "Física Sobre Rodas",insc: 1, org:"NFIST", details:"A Física Sobre Rodas é um evento que conta com diversas atividades organizadas pelo NFIST e inteiramente dedicadas aos objetivos que se apresentam de seguida. Entre estas atividades incluem­-se experiências de física, observações astronómicas, sessões de planetário, palestras e workshops. \n \n Programa:\n -Experiências do Circo da Física \n -Sessões de Planetário \n -Observações Astronómicas \n -Workshops \n -Palestras \n -Revista PULSAR \n A Física Sobre Rodas 2016 decorre ao longo do mês de Julho, em vários locais espalhados por Portugal.",imagelink:"https://scontent.xx.fbcdn.net/v/t1.0-9/12728805_1125285837495614_7351818647618704765_n.jpg?oh=e9ca2d219d92c3b3b956c504b8bdb118&oe=57D03058" ,link:"http://nfist.pt/", date: "2016-07-20 9:00",dateEnd: "2016-07-28 23:00", topic: "Physics", level:2)!
        
        let event52 = Event(name:"Estágio ATLAS" ,insc:1 ,org:"IST - LIP" ,details:"O LHC é actualmente o acelerador de hadrões mais potente do mundo que serve para estudar as partículas fundamentais. A nossa equipa faz parte da colaboração internacional de físicos e engenheiros que opera a gigantesca experiência ATLAS, no CERN. Este detector regista as colisões de protões ou de iões de chumbo acelerados pelo LHC, que analisamos em seguida, para procurar as respostas a algumas das questões mais fundamentais da física de hoje em dia.\n \n Neste estágio queremos dar uma visão do que é o trabalho de investigação em física de partículas, com foco na actividade portuguesa dentro da experiência ATLAS. Vamos integrar na nossa equipa estudantes a partir do 1º ciclo de física e engenharia física, para trabalhar em desafios concretos e actuais no desenvolvimento de detectores, na análise de física e em computação avançada:\n \n Estudo das propriedades do bosão de Higgs no LHC \nDesenvolvimento de algoritmos paralelos em processadores gráficos (GPUs) para a selecção de colisões em tempo real \n Estudo do plasma de quarks e gluões em colisões de iões pesados \n  Caracterização de fibras e cintiladores para o período de alta luminosidade do LHC \n \n O estágio terá uma duração entre 2 e 4 semanas, dependendo da disponibilidade dos estudantes, com início no dia 5 de Setembro. O programa de trabalho será adaptado ao background de cada estudante, e os resultados obtidos serão apresentados num workshop a realizar no dia 30 de Setembro." ,imagelink:"https://pbs.twimg.com/profile_images/567384601857765377/B4E4y9Ov.jpeg" ,link:"http://www.lip.pt/estagioatlas2016/" ,date:"05-09-2016 08:00" ,dateEnd:"06-10-2016 15:00" ,topic:"Physics" ,level: 4)!
     
        let event53 = Event(name:"8ª Escola de Astrofísica e Gravitação" ,insc:1 ,org:"IST - CENTRA" ,details:"Queres aprender o que são ondas gravitacionais? Como é que o universo evolui e como é podemos medir/observar essa evolução? Se sim então estás no lugar correto pois a EAG8 tem muitas respostas para ti.\n \nO CENTRA (Centro Multidisciplinar de Astrofísica) organiza pela oitava vez a sua prestigiada Escola de Astrofísica e Gravitação (EAG8). Esta escola, que tem lugar a cada dois anos, tem  como objectivo formar e incentivar novos talentos e actualizar interessados nas áreas de Astrofísica e Gravitação. Esta Escola de Verão é dirigida a alunos universitários de Física, de Matemática e de Engenharia. \n \n O principal critério de seleção é a média de curso, podendo ser dada prioridade aos alunos interessados em desenvolver investigação nas áreas de Astronomia, Astrofísica ou Gravitação. Estes alunos deverão referir o seu interesse nestas áreas na secção de Observações Relevantes no formulário de inscrição. Será também levada em conta, tanto quanto possível, uma distribuição geográfica homogénea. \n \n Este ano o CENTRA providenciará o almoço e suporte financeiro (a nivel da estadia) a alguns alunos que se desloquem de fora de Lisboa. As inscrições estão abertas até dia 30 de Junho e são limitadas portanto, inscreve-te já!" ,imagelink:"http://jornadasdefisica.nfist.pt/images/centra.png" ,link:"https://centra.tecnico.ulisboa.pt/pt/network/eag8" ,date:"01-09-2016 08:00" ,dateEnd:"06-09-2016 20:00" ,topic:"Physics" ,level: 4)!
        
        let event54 = Event(name:" Research Paper – Editing for Publication" ,insc:1 ,org:"IST" ,details:"A Estrutura de Formação Contínua informa que vai decorrer de 22 de junho a 1 de julho um novo curso de escrita científica em formato avançado destinado a todos os que já possuem alguns conhecimentos neste âmbito e pretendam aprofundar as suas competências na edição de todo o género de textos e relatórios científicos incluíndo “papers”, teses de doutoramento e dissertações de mestrado.\n \nResearch Paper – editing for publication (advanced writing course) é lecionado em língua inglesa num módulo de 24 horas. O programa, pode ser consultado no seguinte ficheiro." ,imagelink:"https://upload.wikimedia.org/wikipedia/pt/e/ed/IST_Logo.png" ,link:"http://da.tecnico.ulisboa.pt/arquivos/research-paper-editing-for-publication-advanced-writing-course-2/" ,date:"22-06-2016 17:30" ,dateEnd:"01-07-2016 20:30" ,topic:"General" ,level: 4)!
        
        let event55 = Event(name:"Light Cone 2016" ,insc:1 ,org:"ILCAC" ,details:"The main objective of the Light Cone 2016 conference series is to provide a yearly update of the knowledge in light-front theory and its phenomenological applications.\n \n Light-front theory provides a suitable framework to calculate observables such as scattering amplitudes, decay rates, spin effects, parton distributions, and other hadronic observables. Indirectly, a comparison of these calculations to experimental data can illuminate novel QCD effects.\n \nThe conferences of the series Light Cone are held each year under the auspices of the International Light Cone Advisory Committee (ILCAC) (http://www.ilcacinc.org) . \n \n An important aspect of the Conference series is to motivate and encourage young researchers in the field and prepare them for leadership roles. \n \n The LC2016 conference takes place at IST, Universidade de Lisboa, Portugal, from 5 to 8 September 2016.\n \n Topics to be included are:\n New frontiers and challenges in experimental Hadron Physics\nLight Front Field Theory in QCD and QED \n Non-perturbative methods in Quantum Field theory\n  Lattice Gauge Theories \n Relativistic models for hadrons and nuclei \n   Few-Body problems on the Light Cone. \n \n Registration: from 1st March to 25th August" ,imagelink:"http://www.lc2016.net/ficheiros/files/LC2016/LC2016_9.jpg" ,link:"http://www.lc2016.net/" ,date:"05-09-2016 8:00" ,dateEnd:"08-09-2016 22:00" ,topic:"Physics" ,level: 4)!
        
        let event56 = Event(name:"MIT Advanced Courses" ,insc:1 ,org:"IST - MIT" ,details:"The doctoral programs listed above were selected under the call from Fundação para a Ciência e a Tecnologia, IP (FCT,IP), through which ten scholarships per year per program are awarded to selected candidates. The jury of each doctoral program will select the candidates to receive the scholarships funded though the FCT,IP. The contract for each scholarship will be signed directly by the selected candidate and FCT. " ,imagelink:"https://pbs.twimg.com/profile_images/444233334781005824/Y8da5CzX.png" ,link:"http://www.mitportugal.org/application/applying.html" ,date:"04-07-2016 8:00" ,dateEnd:"05-09-2016 22:00" ,topic:"Physics" ,level: 5)!
        
        
        let event57 = Event(name:"Workshop on Multi-Higgs Models" ,insc:1 ,org:"IST - CFTP" ,details:"Given LHC's Run 1, the ATLAS and CMS experiments at CERN could confidently announce the discovery a scalar particle of 125 GeV consistent with the Standard Model Higgs boson. François Englert and Peter W. Higgs have been awarded the Nobel Prize in Physics 2013 for the development of the symmetry breaking mechanism and its signature particle. LHC's Run 2 is scrutinizing the properties of the 125 GeV scalar to unprecedentend precision and probing whether there is indeed only one Higgs scalar or, perhaps, more. Indeed, in December 2015 ATLAS and CMS announced tantalizing signals of a second scalar resonance around 750 GeV. \n \nThis Workshop brings together those interested in the theory and phenomenology of Multi-Higgs models. The program is designed to include talks given by some of the leading experts in the field, and also ample time for discussions and collaboration betweeen researchers. A particular emphasis will be placed on identifying those features of the models testable at the LHC's Run 2.   " ,imagelink:"http://cftp.tecnico.ulisboa.pt/~2hdmwork/logos/logoCFTP_small.png" ,link:"http://cftp.tecnico.ulisboa.pt/~2hdmwork/" ,date:"06-09-2016 8:00" ,dateEnd:"09-09-2016 22:00" ,topic:"Physics" ,level: 5)!
        
        let event58 = Event(name:"Scientific Writing & Publication – research papers & thesis" ,insc:1 ,org:"IST" ,details:"A Estrutura de Formação Contínua da Direção Académica informa que vai decorrer de 6 a 14 de julho mais uma ação de formação destinada a todos os que pretendem adquirir competências no âmbito da escrita científica, apresentações e/ou comunicações de trabalhos científicos, como investigadores e alunos de doutoramento e/ou de mestrado que não dominem as técnicas necessárias para uma escrita eficaz no âmbito da divulgação da sua atividade científica. " ,imagelink:"https://upload.wikimedia.org/wikipedia/pt/e/ed/IST_Logo.png" ,link:"http://da.tecnico.ulisboa.pt/arquivos/scientific-writing-publication-research-papers-thesis-2/" ,date:"06-07-2016 17:30" ,dateEnd:"14-07-2016 20:30" ,topic:"General" ,level:4)!
        
        
    events += [event42, event6, event7, event22, event4, event8, event24, event43, event44, event9, event10, event25, event48, event26, event11, event12, event19, event15, event27, event50, event28, event46, event29, event30, event31, event32, event33, event20, event34, event35, event36, event45, event54, event3, event47, event37, event38, event39, event2, event13, event14, event21, event56, event58, event16, event40, event1, event17, event41, event18, event51, event5, event53, event52, event49,event55, event57, event23]
     }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let interests = defaults.objectForKey("userInterests") as? [String: Bool] ?? [String: Bool]()
        var intList: [String];
        intList = ["All"]
        
        for (interestName, isInterest) in interests {
            if isInterest{
                intList.append(interestName);
            }
        }
        
        // Load the sample data.
        loadSampleEvents()
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.scopeButtonTitles = intList

        searchController.searchBar.delegate = self
        /*
        let mainDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        
        // initialize FMDB
        let db: FMDatabase = FMDatabase(path:mainDelegate.dbPath as String)
        if !db.open() {
            NSLog("error opening db")
        }
        
        
        
        // get data from db and store into array used by UITableView
        let mainQuery = "SELECT * FROM evento"
        let rsMain: FMResultSet? = db.executeQuery(mainQuery, withArgumentsInArray: nil)
        
        
        while (rsMain!.next() == true) {
            let Nome = rsMain?.stringForColumn("nome")
            let ins = rsMain?.intForColumn("insc")
            let organization = rsMain?.stringForColumn("org")
            let detalhes = rsMain?.stringForColumn("detalhes")
            let datein = rsMain?.stringForColumn("datai")
            let dateen = rsMain?.stringForColumn("dataf")
            let topico = rsMain?.stringForColumn("topico")
            let nivel = rsMain?.intForColumn("nivel")
            let linkSite = rsMain?.stringForColumn("link")
            let imagem = rsMain?.stringForColumn("imagelink")
            
            let eventos = Event(name: Nome!, insc: ins!, date: datein! , dateEnd: dateen! , details: detalhes! ,link: linkSite! , org: organization!, topic: topico!, level: nivel!, imagelink: imagem! )
            NSLog("Picha")
            events.append(eventos!)
            NSLog("Pichum")
        }
        
        // example: get num rows
        if let rsTemp: FMResultSet? = db.executeQuery("SELECT COUNT(*) as numrows FROM evento", withArgumentsInArray: nil){
            while rsTemp!.next(){
                let numrows = rsTemp?.intForColumn("numrows")
                NSLog("numrows: \(numrows)")
            }
        }
        
        db.close()
        */
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != "" {
            return filteredEvents.count
        }
        return events.count
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "EventTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! EventTableViewCell
        
        let event: Event
        if searchController.active && searchController.searchBar.text != "" {
            event = filteredEvents[indexPath.row]
        } else {
            event = events[indexPath.row]
        }
        
        cell.nameLabel.text = event.name
        cell.dateLabel.text = event.date
        cell.orgLabel.text = event.org
        
        
        let url = event.imagelink
        getDataFromUrl(NSURL(string: url)!) { (data, response, error)  in
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                guard let data = data where error == nil else { return }
                print(response?.suggestedFilename ?? "")
                print("Download Finished")
                cell.photoImageView.image = UIImage(data: data)!
            }
        }
        
        return cell
        
    }
    
    func getDataFromUrl(url:NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError? ) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            completion(data: data, response: response, error: error)
            }.resume()
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredEvents = events.filter ({( event : Event) -> Bool in
            let topicMatch = (scope == "All") || (event.topic == scope)
            return  topicMatch && event.name.lowercaseString.containsString(searchText.lowercaseString)
        })
        tableView.reloadData()
    }
    

    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Detail" {
            
            let controller = segue.destinationViewController as! FirstViewController
            
            if let selectedCell = sender as? EventTableViewCell {
                
                let indexPath = tableView.indexPathForCell(selectedCell)!
                let event: Event
                if searchController.active && searchController.searchBar.text != "" {
                    event = filteredEvents[indexPath.row]
                } else {
                    event = events[indexPath.row]
                }
                
                controller.detailEvent = event
                
                //controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
        
    }
    
    
    
    func displayMyAlertMessage(userMessage:String){
        var myAlert = UIAlertController(title:"Alert", message: userMessage,preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.presentViewController(myAlert, animated:true, completion:nil)
        
    }


}



extension TableTableViewController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
}

extension TableTableViewController: UISearchBarDelegate {
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {

        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}


