-- Create a new database called 'HospitalManagement'
CREATE DATABASE IF NOT EXISTS SocialMediaAnalytics;

-- Switch to the newly created database
USE SocialMediaAnalytics;



-- Index on the Username column in the Users table
CREATE INDEX idx_Users_Username ON Users (Username);

-- Index on the PostDate column in the Posts table
CREATE INDEX idx_Posts_PostDate ON Posts (PostDate);

-- Composite index on PostID and CommentDate columns in the Comments table
CREATE INDEX idx_Comments_PostID_CommentDate ON Comments (PostID, CommentDate);



-- CREATING TABLES

-- Table to store information about users
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL,
    FullName VARCHAR(100),
    Email VARCHAR(100),
    Location VARCHAR(100),
    JoinDate DATE
);

-- Inserting 15 data values into the Users table
INSERT INTO Users (Username, FullName, Email, Location, JoinDate)
VALUES
('teacherJohn', 'John Doe', 'john@teachersrock.com', 'New York', '2023-03-01'),
('mathwizard', 'Jane Smith', 'jane@mathgurus.org', 'Los Angeles', '2023-04-15'),
('scienceguy', 'Michael Johnson', 'michael@scienceforall.edu', 'Chicago', '2023-05-20'),
('historynut', 'Emily Davis', 'emily@pastexplorers.com', 'Houston', '2023-06-10'),
('englishpro', 'David Wilson', 'david@wordsmithacademy.edu', 'Phoenix', '2023-07-05'),
('codekid', 'Sophia Thompson', 'sophia@codeforkids.org', 'Philadelphia', '2023-08-15'),
('artenthusiast', 'William Brown', 'william@creativeminds.com', 'San Antonio', '2023-09-01'),
('musicsage', 'Olivia Garcia', 'olivia@melodymakers.edu', 'San Diego', '2023-10-10'),
('fitnessfan', 'Daniel Martinez', 'daniel@activeminds.org', 'Dallas', '2023-11-20'),
('ecowarrior', 'Avery Hernandez', 'avery@greenfuture.com', 'San Jose', '2023-12-05'),
('languagelover', 'Isabella Gonzalez', 'isabella@linguaexperts.edu', 'Austin', '2024-01-15'),
('psychologypro', 'Jacob Rodriguez', 'jacob@mindmatters.org', 'Jacksonville', '2024-02-01'),
('businesswhiz', 'Mia Perez', 'mia@entrepreneursuccess.com', 'Fort Worth', '2024-03-10'),
('politicaljunkie', 'William Sanchez', 'william@civicengagement.edu', 'Columbus', '2024-04-20'),
('healthnut', 'Sofia Ramirez', 'sofia@wellnesswarriors.org', 'Charlotte', '2024-05-01');

-- Table to store information about posts
CREATE TABLE Posts (
    PostID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    PostContent TEXT,
    PostDate DATETIME,
    Platform VARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Inserting 15 data values into the Posts table
INSERT INTO Posts (UserID, PostContent, PostDate, Platform)
VALUES
(1, 'Sharing my favorite teaching resources for elementary math!', '2024-04-01 08:00:00', 'Facebook'),
(2, 'Check out this amazing calculus tutorial I found!', '2024-04-02 10:30:00', 'Twitter'),
(3, 'Who\'s excited for the upcoming science fair? I sure am!', '2024-04-03 14:00:00', 'Instagram'),
(4, 'Discovered a fascinating documentary on ancient civilizations.', '2024-04-04 18:00:00', 'Facebook'),
(5, 'Looking for book recommendations for advanced English literature.', '2024-04-05 09:00:00', 'Twitter'),
(6, 'Impressed by these young coders\' projects! Future is bright.', '2024-04-06 12:00:00', 'Instagram'),
(7, 'Celebrating the work of famous artists in our online exhibition.', '2024-04-07 15:00:00', 'Facebook'),
(8, 'Who\'s attending the music theory workshop this weekend?', '2024-04-08 10:00:00', 'Twitter'),
(9, 'Sharing some awesome fitness routines for students!', '2024-04-09 16:00:00', 'Instagram'),
(10, 'Join our eco-friendly campaign to reduce plastic waste in schools!', '2024-04-10 11:00:00', 'Facebook'),
(11, 'Learning a new language? Check out these amazing language apps!', '2024-04-11 14:00:00', 'Twitter'),
(12, 'Discussing the importance of mental health awareness in schools.', '2024-04-12 17:00:00', 'Instagram'),
(13, 'Entrepreneurship club is hosting a pitch competition next month!', '2024-04-13 09:00:00', 'Facebook'),
(14, 'Heated debate on the latest political issue affecting education.', '2024-04-14 13:00:00', 'Twitter'),
(15, 'Sharing healthy snack ideas for students to stay energized!', '2024-04-15 11:00:00', 'Instagram');

-- Table to store information about comments
CREATE TABLE Comments (
    CommentID INT PRIMARY KEY AUTO_INCREMENT,
    PostID INT,
    UserID INT,
    CommentContent TEXT,
    CommentDate DATETIME,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Inserting 15 data values into the Comments table
INSERT INTO Comments (PostID, UserID, CommentContent, CommentDate)
VALUES
(1, 2, 'Thanks for sharing! I\'ll definitely check these out.', '2024-04-01 08:05:00'),
(2, 3, 'Calculus is tough, but this looks promising. Appreciate it!', '2024-04-02 10:35:00'),
(3, 4, 'Count me in! Can\'t wait to see the projects.', '2024-04-03 14:05:00'),
(4, 5, 'Ooh, what\'s the name of the documentary? Sounds intriguing!', '2024-04-04 18:10:00'),
(5, 6, 'Have you read any works by Jane Austen? Her writing is exceptional.', '2024-04-05 09:10:00'),
(6, 7, 'Incredible work! These kids are truly inspiring.', '2024-04-06 12:10:00'),
(7, 8, 'Will there be a virtual tour option for those unable to attend?', '2024-04-07 15:10:00'),
(8, 9, 'I\'m planning to go! Let\'s connect and attend together.', '2024-04-08 10:10:00'),
(9, 10, 'Great idea! Staying active is so important for students.', '2024-04-09 16:10:00'),
(10, 11, 'Thanks for sharing! We need more initiatives like this.', '2024-04-10 11:10:00'),
(11, 12, 'Language learning apps have come a long way. Duolingo is my favorite.', '2024-04-11 14:10:00'),
(12, 13, 'Absolutely crucial topic. Mental health support is vital.', '2024-04-12 17:10:00'),
(13, 14, 'Exciting! I have a few business ideas I\'ve been working on.', '2024-04-13 09:10:00'),
(14, 15, 'I\'d love to hear more perspectives on this issue.', '2024-04-14 13:10:00'),
(15, 1, 'Healthy snacks are a game-changer for staying focused!', '2024-04-15 11:10:00');


-- Table to store information about likes
CREATE TABLE Likes (
    LikeID INT PRIMARY KEY AUTO_INCREMENT,
    PostID INT,
    UserID INT,
    LikeDate DATETIME,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Inserting 15 data values into the Likes table
INSERT INTO Likes (PostID, UserID, LikeDate)
VALUES
(1, 3, '2024-04-01 08:10:00'),
(2, 4, '2024-04-02 10:40:00'),
(3, 5, '2024-04-03 14:10:00'),
(4, 6, '2024-04-04 18:15:00'),
(5, 7, '2024-04-05 09:15:00'),
(6, 8, '2024-04-06 12:15:00'),
(7, 9, '2024-04-07 15:15:00'),
(8, 10, '2024-04-08 10:15:00'),
(9, 11, '2024-04-09 16:15:00'),
(10, 12, '2024-04-10 11:15:00'),
(11, 13, '2024-04-11 14:15:00'),
(12, 14, '2024-04-12 17:15:00'),
(13, 15, '2024-04-13 09:15:00'),
(14, 1, '2024-04-14 13:15:00'),
(15, 2, '2024-04-15 11:15:00');

-- Table to store sentiments of posts and comments
CREATE TABLE Sentiments (
    SentimentID INT PRIMARY KEY AUTO_INCREMENT,
    PostID INT,
    CommentID INT,
    SentimentScore FLOAT,
    SentimentType ENUM('Positive', 'Neutral', 'Negative'),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (CommentID) REFERENCES Comments(CommentID)
);

-- Inserting 15 data values into the Sentiments table
INSERT INTO Sentiments (PostID, CommentID, SentimentScore, SentimentType)
VALUES
(1, 1, 0.9, 'Positive'),
(2, 2, 0.8, 'Positive'),
(3, 3, 0.7, 'Positive'),
(4, 4, 0.9, 'Positive'),
(5, 5, 0.6, 'Neutral'),
(6, 6, 0.9, 'Positive'),
(7, 7, 0.5, 'Neutral'),
(8, 8, 0.8, 'Positive'),
(9, 9, 0.7, 'Positive'),
(10, 10, 0.9, 'Positive'),
(11, 11, 0.6, 'Neutral'),
(12, 12, 0.8, 'Positive'),
(13, 13, 0.7, 'Positive'),
(14, 14, 0.5, 'Neutral'),
(15, 15, 0.9, 'Positive');

-- Table to store trending topics
CREATE TABLE Trends (
    TrendID INT PRIMARY KEY AUTO_INCREMENT,
    Topic VARCHAR(100),
    TrendDate DATE
);

-- Inserting 15 data values into the Trends table
INSERT INTO Trends (Topic, TrendDate)
VALUES
('TeachingResources', '2024-04-01'),
('CalculusTutorials', '2024-04-02'),
('ScienceFair', '2024-04-03'),
('AncientCivilizations', '2024-04-04'),
('EnglishLiterature', '2024-04-05'),
('KidCoders', '2024-04-06'),
('ArtExhibition', '2024-04-07'),
('MusicWorkshop', '2024-04-08'),
('StudentFitness', '2024-04-09'),
('EcoFriendlyCampaign', '2024-04-10'),
('LanguageLearning', '2024-04-11'),
('MentalHealthAwareness', '2024-04-12'),
('EntrepreneurshipCompetition', '2024-04-13'),
('EducationPolitics', '2024-04-14'),
('HealthySnacks', '2024-04-15');