-- Creating Candidates table with primary key
CREATE TABLE Candidates (
    candidate_id INTEGER PRIMARY KEY,
    name TEXT,
    party_affiliation TEXT,
    position TEXT
);

-- -- Task 2: DROP PRIMARY KEY
-- Dropping primary key constraint from Candidates table (if it exists)
ALTER TABLE Candidates DROP CONSTRAINT IF EXISTS Candidates_pkey;

-- -- Task 3: ADD PRIMARY KEY
-- Adding primary key constraint to Candidates table on candidate_id column
ALTER TABLE Candidates ADD PRIMARY KEY (candidate_id);

-- -- Task 4: COMPOSITE PRIMARY KEY
-- Creating Votes table with composite primary key
CREATE TABLE Votes (
    voter_id INTEGER,
    candidate_id INTEGER,
    PRIMARY KEY (voter_id, candidate_id)
);

-- -- Task 5: FOREIGN KEY
-- Adding foreign key constraint in Votes table referencing Candidates table
ALTER TABLE Votes
ADD CONSTRAINT fk_candidate
FOREIGN KEY (candidate_id)
REFERENCES Candidates(candidate_id);

-- -- Task 6: CREATE TABLE with FOREIGN KEY
-- Creating Voters table with primary key and foreign key constraint
CREATE TABLE Voters (
    voter_id INTEGER PRIMARY KEY,
    name TEXT,
    age INTEGER,
    voted_for INTEGER,
    FOREIGN KEY (voted_for) REFERENCES Candidates(candidate_id)
);

-- -- Task 7.DROP FOREIGN KEY
-- Dropping foreign key constraint from Voters table (if it exists)
ALTER TABLE Voters DROP CONSTRAINT IF EXISTS Voters_voted_for_fkey;

-- -- Task 8: ADD FOREIGN KEY
-- Adding foreign key constraint to Voters table referencing Candidates table
ALTER TABLE Voters
ADD CONSTRAINT fk_candidate_voter
FOREIGN KEY (voted_for)
REFERENCES Candidates(candidate_id);

-- -- Data Manipulation:
-- Assuming example data for Candidates and Voters:
-- Inserting data into Candidates table
INSERT INTO Candidates (candidate_id, name, party_affiliation, position)
VALUES
    (1, 'Candidate 1', 'Party A', 'President'),
    (2, 'Candidate 2', 'Party B', 'Senator'),
    (3, 'Candidate 3', 'Party C', 'Governor'),
    (4, 'Candidate 4', 'Party A', 'Mayor'),
    (5, 'Candidate 5', 'Party B', 'Councilor');
    
-- Inserting data into Voters table
INSERT INTO Voters (voter_id, name, age, voted_for)
VALUES
    (101, 'Voter 1', 25, 2),
    (102, 'Voter 2', 30, 3),
    (103, 'Voter 3', 28, 1),
    (104, 'Voter 4', 40, 4),
    (105, 'Voter 5', 22, 2),
    (106, 'Voter 6', 35, 5),
    (107, 'Voter 7', 29, 1),
    (108, 'Voter 8', 31, 3),
    (109, 'Voter 9', 27, 4),
    (110, 'Voter 10', 33, 5);

-- Queries for Data Manipulation:
-- Retrieve candidate details:
SELECT * FROM Candidates;

-- Find voters who voted for a specific candidate (e.g., Candidate 2):
SELECT Voters.name, Candidates.name AS voted_for_candidate
FROM Voters
JOIN Candidates ON Voters.voted_for = Candidates.candidate_id
WHERE Candidates.candidate_id = 2;










