create table Pokemon (
	Id varchar(36) not null,
    Name varchar(50) not null,
    GenerationId varchar(36) not null,
    EvolutionPokemonId varchar(36),
    constraint PK_Pokemon_Id primary key (Id),
    constraint FK_Pokemon_Pokemon_EvolutionPokemonId foreign key (EvolutionPokemonId) references Pokemon(Id),
    constraint UC_Pokemon_Name unique (Name)
	
);

create table PokemonEvolution(
	Id varchar(36) not null,
    PokemonId varchar(36) not null,
    EvolutionId varchar(36) not null
);


create table Generation (
	Id varchar(36) not null,
    Abrv varchar(10) not null,
	Name varchar(30) not null
    
);

create table Type(
	Id varchar(36) not null,
    Abrv varchar(10) not null,
	Name varchar(30) not null
    
);

create table PokemonType(
	Id varchar(36) not null,
    PokemonId varchar(36) not null,
    TypeId varchar(36) not null
);