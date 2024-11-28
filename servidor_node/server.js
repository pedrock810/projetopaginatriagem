const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const mysql = require('mysql');


const app = express();
const port = 3000;

app.use(cors()); 
app.use(bodyParser.json());

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'apps_moveis',
});

connection.connect();

//ROTA PARA ENVIAR DADOS PARA A BASE DE DADOS
app.post('/api/insertUser', (req, res) => {
    const { nome, sobrenome, email, senha } = req.body;
    const query = 'INSERT INTO users (nome, sobrenome, email, senha) VALUES (?, ?, ?, ?)';
    const values = [nome, sobrenome, email, senha];

    connection.query(query, values, (error, results) => {
        if (error) {
            console.error('Erro ao inserir usuário:', error);
            res.status(500).send('Erro ao adicionar usuário.');
            return;
        }
        res.status(200).send('Registro adicionado com sucesso!');
    });
});

//ROTA PARA FAZER A CONFERENCIA DO EMAIL (SE ELE EXISTE OU NÃO)
app.get('/api/verificarEmail', (req, res) => {
    const { email } = req.query;

    console.log('Email recebido do Flutter:', email);

    const query = `SELECT * FROM users WHERE email = "${email}";`;

    connection.query(query, (error, results) => {
        if (error) throw error;

        if (results.length > 0) {
            res.json({ existe: true });
        } else {
            res.json({ existe: false });
        }

        console.log("RESPOSTA RECEBIDA BD: ", results)
        console.log("TAMANHO DO RESULTS: ", results.length)
    });
});


//ROTA PARA FAZER A VERIFICAÇÃO DO LOGIN
app.post('/api/verificarLogin', (req, res) => {
    const { email, senha } = req.body;

    const query = `SELECT * FROM users WHERE email = "${email}" AND senha = "${senha}";`;

    connection.query(query, (error, results) => {
        if (error) throw error;

        if (results.length > 0) {

            const usuario = {
                id: results[0].id,
                nome: results[0].nome,
                sobrenome: results[0].sobrenome,
                email: results[0].email,
            };

            res.json({ correto: true, usuario: usuario });

        } else {
            res.json({ correto: false, usuario: 'inválido' });
        }

        console.log("RESPOSTA RECEBIDA BD: ", results)
        console.log("TAMANHO DO RESULTS: ", results.length)
    });
});

//ROTA PARA SALVAR PACIENTE NA BASE DE DADOS APPS_MOVEIS -> ELE TAMBÉM SALVA O ID DO MÉDICO LOGADO
app.post('/salvarPacienteDB', (req, res) => {
    const {
        nome,
        sobrenome,
        utente,
        genero,
        idade,
        peso,
        altura,
        contacto,
        diagnostico,
        idMedico
    } = req.body;

    const query = `INSERT INTO pacientes (idMedico, nome, sobrenome, utente, genero, idade, peso, altura, contacto, diagnostico) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;

    connection.query(
        query,
        [idMedico, nome, sobrenome, utente, genero, idade, peso, altura, contacto, diagnostico],
        (error, results) => {
            if (error) {
                console.error('Erro ao inserir paciente: ', error);
                res.status(500).send('Erro ao salvar paciente');
            } else {
                console.log('Paciente inserido com sucesso');
                res.status(200).send('Paciente salvo com sucesso');
            }
        }
    );
});

//ROTA PARA FAZER A LISTAGEM DOS PACIENTES REFERENTES AO MÉDICO LOGADO NA PÁGINA DE PERFIL
app.get('/api/listarPacientes', (req, res) => {
    const id_medico = req.query.id;

    console.log("ID DO MEDICO RECEBIDA: ", id_medico);

    // Lógica para verificar se o login está correto
    const query = `SELECT * FROM pacientes WHERE idMedico = "${id_medico}";`;

    connection.query(query, (error, results) => {
        if (error) {
            console.error("Erro ao executar a consulta:", error);
            return res.status(500).json({ error: "Erro interno no servidor" });
        }

        res.json(results);

        console.log("PACIENTES RECEBIDOS BD: ", results);
    });
});


//ROTA PARA FAZER A LISTAGEM DAS NOTICIAS NA PAGINA PRINCIPAL
app.get('/api/noticias', (req, res) => {
    const noticias = [
        {
            titulo: 'Nova descoberta no tratamento do câncer',
            imagem: 'https://sciath.com.br/wp-content/uploads/2022/01/tratamento-cancer.jpg',
            descricao: 'Uma nova abordagem no tratamento do câncer foi descoberta recentemente.',
        },
        {
            titulo: 'Avanços na pesquisa de vacinas',
            imagem: 'https://www.paho.org/sites/default/files/styles/max_1500x1500/public/2021-04/vaccine-safety-1500x810.jpg?itok=Mx_pfXdX',
            descricao: 'Pesquisadores anunciam progressos promissores na busca por vacinas eficazes.',
        },
        {
            titulo: 'Estudo revela benefícios da prática regular de exercícios',
            imagem: 'https://i1.wp.com/educa.cetrus.com.br/wp-content/uploads/2020/12/shutterstock_145398733.jpg',
            descricao: 'Uma pesquisa revela os impactos positivos da prática regular de exercícios na saúde.',
        },
        {
            titulo: 'Tratamentos inovadores para doenças neurodegenerativas',
            imagem: 'https://d3043uog1ad1l6.cloudfront.net/uploads/2020/06/Medicina-do-futuro.jpg',
            descricao: 'Novas terapias mostram potencial no tratamento de doenças neurodegenerativas.',
        },
        {
            titulo: 'Métodos de prevenção de doenças cardiovasculares',
            imagem: 'https://www.cardio365.pt/wp-content/uploads/2020/10/doencas-cardiovasculares.jpg',
            descricao: 'Especialistas discutem métodos eficazes para a prevenção de doenças cardiovasculares.',
        },
    ];

    res.json(noticias);
});


app.listen(port, () => {
    console.log(`Servidor Node.js rodando em http://localhost:${port}`);
});
