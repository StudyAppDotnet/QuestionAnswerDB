
CREATE SCHEMA Quiz
GO;

-- Create Procedure for Create QuestionAnswerQuiz Database
CREATE PROCEDURE CreateQuestionAnswerQuizDB
AS
  -- Create Database
  CREATE DATABASE [QuestionAnswerQuiz];
  
  -- Index Table
  CREATE TABLE Quiz.QuizIndex (
    ID INT PRIMARY KEY IDENTITY, 
    QuizID INT NOT NULL
  )
  -- Quiz Name Table
  CREATE TABLE Quiz.Name (
    ID INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(60),
    OwnerID INT NOT NULL
  )
  -- Question Entity Table
  CREATE TABLE Quiz.Question (
    ID INT PRIMARY KEY IDENTITY, 
    Question NTEXT NOT NULL, 
    AnswerID INT NOT NULL, 
    QuizNameID INT NOT NULL
  )
  -- Answer Entity Table
  CREATE TABLE Quiz.Answer (
    ID INT PRIMARY KEY IDENTITY, 
    Answer NTEXT NOT NULL
  )

  -- Create Index on Quiz.Index Table
  CREATE INDEX QuizIndex ON QuizIndex (ID, QuizID);

  --
  -- Add Foreign Key Constrains
  --
  ALTER TABLE Quiz.Question 
  ADD CONSTRAINT FK_AnswerID 
  FOREIGN KEY (AnswerID) 
  REFERENCES Quiz.Answer(ID);

  ALTER TABLE Quiz.Question 
  ADD CONSTRAINT FK_QuizNameID 
  FOREIGN KEY (QuizNameID) 
  REFERENCES Quiz.Name(ID); 

  ALTER TABLE Quiz.QuizIndex 
  ADD CONSTRAINT FK_QuizNameID 
  FOREIGN KEY (QuizID) 
  REFERENCES Quiz.Name(ID); 
  GO;

-- Create Procedure for delete QuestionAnswerQuiz Database
  CREATE PROCEDURE DropQuestionAnswerQuizDB
  AS
    Drop DATABASE QuestionAnswerQuiz;
  GO;

