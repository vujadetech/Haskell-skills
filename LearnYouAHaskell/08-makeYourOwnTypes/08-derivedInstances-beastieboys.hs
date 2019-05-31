data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     } deriving (Eq, Show, Read)

mikeD = Person {firstName = "Michael", lastName = "Diamond", age = 43}
adRock = Person {firstName = "Adam", lastName = "Horovitz", age = 41}
mca = Person {firstName = "Adam", lastName = "Yauch", age = 44}

-- Note the ":: Person" type info at the end. It won't parse otherwise.
s = read "Person {firstName =\"Michael\", lastName =\"Diamond\", age = 43}" :: Person

{-
We can also read parameterized types, but we have to fill in the type parameters.
So we can't do read "Just 't'" :: Maybe a, but we can do read "Just 't'" :: Maybe Char.
-}
ch = read "Just 't'" :: Maybe Char

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
           deriving (Eq, Ord, Show, Read, Bounded, Enum)

-- Type synonyms

-- type String = [Char] -- Like a C typedef

--type PhoneBook = [(String,String)]  -- Note the capital P. Redefined below.

phoneBook :: PhoneBook
phoneBook =
    [("betty","555-2938")
    ,("bonnie","452-2928")
    ,("patsy","493-2928")
    ,("lucille","205-2928")
    ,("wendy","939-8282")
    ,("penny","853-2492")
    ]

type PhoneNumber = String
type Name = String
type PhoneBook = [(Name,PhoneNumber)]

inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool
inPhoneBook name pnumber pbook = (name,pnumber) `elem` pbook

type AssocList k v = [(k,v)]

--type IntMap v = Map Int v
--Or we could do it like this (point free style):
--type IntMap = Map Int
--NB:  If you're going to try and implement this, you'll probably going to do a qualified
--mport of Data.Map. When you do a qualified import, type
--constructors also have to be preceeded with a module name. So you'd write type IntMap = Map.Map Int.

data Either a b = Left a | Right b deriving (Eq, Ord, Read, Show)
