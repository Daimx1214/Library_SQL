-- ==============================================================
-- Core lookup / hierarchy
-- ==============================================================
CREATE TABLE dbo.University (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Name NVARCHAR(255) NOT NULL,
    Code NVARCHAR(50) NULL,
    Description NVARCHAR(MAX) NULL
);
GO
CREATE TABLE dbo.Campus (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Name NVARCHAR(255) NOT NULL,
    Code NVARCHAR(50) NULL,
    Description NVARCHAR(MAX) NULL,
    UniversityId INT NOT NULL,
    CONSTRAINT FK_Campus_University FOREIGN KEY (UniversityId) REFERENCES dbo.University(Id)
);
GO
CREATE TABLE dbo.Block (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Name NVARCHAR(255) NOT NULL,
    Code NVARCHAR(50) NULL,
    CampusId INT NOT NULL,
    CONSTRAINT FK_Block_Campus FOREIGN KEY (CampusId) REFERENCES dbo.Campus(Id)
);
GO
CREATE TABLE dbo.Building (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Name NVARCHAR(255) NOT NULL,
    Code NVARCHAR(50) NULL,
    Description NVARCHAR(MAX) NULL,
    BlockId INT NOT NULL,
    CONSTRAINT FK_Building_Block FOREIGN KEY (BlockId) REFERENCES dbo.Block(Id)
);
GO
CREATE TABLE dbo.Floor (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Name NVARCHAR(255) NOT NULL,
    Code NVARCHAR(50) NULL,
    BuildingId INT NOT NULL,
    CONSTRAINT FK_Floor_Building FOREIGN KEY (BuildingId) REFERENCES dbo.Building(Id)
);
GO
CREATE TABLE dbo.Faculty (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Name NVARCHAR(255) NOT NULL,
    Code NVARCHAR(50) NULL,
    Description NVARCHAR(MAX) NULL,
    EstablishedIn DATETIME NOT NULL,
    CampusId INT NOT NULL,
    CONSTRAINT FK_Faculty_Campus FOREIGN KEY (CampusId) REFERENCES dbo.Campus(Id)
);
GO
CREATE TABLE dbo.Institude ( -- corrected spelling
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Name NVARCHAR(255) NOT NULL,
    Code NVARCHAR(50) NULL,
    FacultyId INT NOT NULL,
    CONSTRAINT FK_Institude_Faculty FOREIGN KEY (FacultyId) REFERENCES dbo.Faculty(Id)
);
GO
CREATE TABLE dbo.Department (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Name NVARCHAR(255) NOT NULL,
    Code NVARCHAR(50) NULL,
    InstituteId INT NOT NULL,
    CONSTRAINT FK_Department_Institude FOREIGN KEY (InstituteId) REFERENCES dbo.Institude(Id)
);
GO
CREATE TABLE dbo.Designation (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Name NVARCHAR(255) NOT NULL,
    Code NVARCHAR(50) NULL,
    Description NVARCHAR(MAX) NULL
);
GO
-- ==============================================================
-- Library physical layout
-- ==============================================================
CREATE TABLE dbo.LibraryType (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Name NVARCHAR(255) NOT NULL,
    Code NVARCHAR(50) NULL,
    Description NVARCHAR(MAX) NULL
);
GO
CREATE TABLE dbo.LibraryBranch (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Description NVARCHAR(MAX) NULL,
    LibraryTypeId INT NOT NULL,
    ParentId INT NULL,
    CONSTRAINT FK_LibraryBranch_Type FOREIGN KEY (LibraryTypeId) REFERENCES dbo.LibraryType(Id),
    CONSTRAINT FK_LibraryBranch_Parent FOREIGN KEY (ParentId) REFERENCES dbo.LibraryBranch(Id)
);
GO
CREATE TABLE dbo.LibraryManagementSection (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Name NVARCHAR(255) NOT NULL,
    Code NVARCHAR(50) NULL,
    Description NVARCHAR(MAX) NULL
);
GO
CREATE TABLE dbo.LibraryBranchManagement (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    LibraryBranchId INT NOT NULL,
    LibraryManagementSectionId INT NOT NULL,
    Code NVARCHAR(50) NULL,
    EstablishedIn DATE NOT NULL,
    CONSTRAINT FK_LibraryBranchManagement_Branch FOREIGN KEY (LibraryBranchId) REFERENCES dbo.LibraryBranch(Id),
    CONSTRAINT FK_LibraryBranchManagement_Section FOREIGN KEY (LibraryManagementSectionId) REFERENCES dbo.LibraryManagementSection(Id)
);
GO
CREATE TABLE dbo.LibraryItemSection (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Name NVARCHAR(255) NOT NULL,
    Code NVARCHAR(50) NULL,
    LibraryBranchId INT NOT NULL,
    DepartmentId INT NULL,
    CONSTRAINT FK_LibraryItemSection_Branch FOREIGN KEY (LibraryBranchId) REFERENCES dbo.LibraryBranch(Id),
    CONSTRAINT FK_LibraryItemSection_Department FOREIGN KEY (DepartmentId) REFERENCES dbo.Department(Id)
);
GO
CREATE TABLE dbo.LibrarianInfo (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Name NVARCHAR(255) NOT NULL,
    Address NVARCHAR(MAX) NULL,
    Email NVARCHAR(255) NULL,
    Contact NVARCHAR(100) NULL,
    LibrarySectionId INT NOT NULL,
    LibraryBranchManagementId INT NOT NULL,
    LibraryTransactionId INT NULL,
    CONSTRAINT FK_LibrarianInfo_Section FOREIGN KEY (LibrarySectionId) REFERENCES dbo.LibraryItemSection(Id),
    CONSTRAINT FK_LibrarianInfo_BranchMgmt FOREIGN KEY (LibraryBranchManagementId) REFERENCES dbo.LibraryBranchManagement(Id)
);
GO
CREATE TABLE dbo.LibraryRacks (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Code NVARCHAR(50) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    LibrarySectionId INT NOT NULL,
    CONSTRAINT FK_LibraryRacks_Section FOREIGN KEY (LibrarySectionId) REFERENCES dbo.LibraryItemSection(Id)
);
GO
CREATE TABLE dbo.LibraryShelf (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Code NVARCHAR(50) NOT NULL,
    LibraryRackId INT NOT NULL,
    MaxCapacity INT NOT NULL DEFAULT 0,
    NoOfItems INT NOT NULL DEFAULT 0,
    CONSTRAINT FK_LibraryShelf_Rack FOREIGN KEY (LibraryRackId) REFERENCES dbo.LibraryRacks(Id)
);
GO
CREATE TABLE dbo.Room (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Name NVARCHAR(255) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    Code NVARCHAR(50) NULL,
    EstablishedIn DATE NOT NULL,
    FloorId INT NOT NULL,
    CONSTRAINT FK_Room_Floor FOREIGN KEY (FloorId) REFERENCES dbo.Floor(Id)
);
GO
CREATE TABLE dbo.LibraryBranchLocation (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    LibraryBranchId INT NOT NULL,
    CampusId INT NOT NULL,
    BuildingId INT NOT NULL,
    FloorId INT NOT NULL,
    RoomId INT NOT NULL,
    Description NVARCHAR(MAX) NULL,
    CONSTRAINT FK_LibraryBranchLocation_Branch FOREIGN KEY (LibraryBranchId) REFERENCES dbo.LibraryBranch(Id),
    CONSTRAINT FK_LibraryBranchLocation_Campus FOREIGN KEY (CampusId) REFERENCES dbo.Campus(Id),
    CONSTRAINT FK_LibraryBranchLocation_Building FOREIGN KEY (BuildingId) REFERENCES dbo.Building(Id),
    CONSTRAINT FK_LibraryBranchLocation_Floor FOREIGN KEY (FloorId) REFERENCES dbo.Floor(Id),
    CONSTRAINT FK_LibraryBranchLocation_Room FOREIGN KEY (RoomId) REFERENCES dbo.Room(Id)
);
GO
-- ==============================================================
-- Parties, Members, Positions
-- ==============================================================
CREATE TABLE dbo.Position (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Category NVARCHAR(100) NULL,
    Code NVARCHAR(50) NULL,
    Description NVARCHAR(MAX) NULL
);
GO
CREATE TABLE dbo.Party (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    PartyName NVARCHAR(255) NOT NULL,
    PartyContact NVARCHAR(100) NULL,
    PartyPositionId INT NULL,
    PartyCompanyId INT NULL,
    PartyTypeId INT NULL,
    CONSTRAINT FK_Party_Position FOREIGN KEY (PartyPositionId) REFERENCES dbo.Position(Id)
);
GO
CREATE TABLE dbo.LibraryMember (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    LibraryBranchId INT NOT NULL,
    PartyId INT NOT NULL,
    CardNo NVARCHAR(100) NOT NULL,
    IssuedOn DATE NOT NULL,
    ExpiredOn DATE NOT NULL,
    MembershipType INT NOT NULL,
    CONSTRAINT FK_LibraryMember_Branch FOREIGN KEY (LibraryBranchId) REFERENCES dbo.LibraryBranch(Id),
    CONSTRAINT FK_LibraryMember_Party FOREIGN KEY (PartyId) REFERENCES dbo.Party(Id)
);
GO
CREATE TABLE dbo.MemberBlock (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    LibraryMemberId INT NOT NULL,
    LibraryBranchId INT NOT NULL,
    Reason NVARCHAR(500) NULL,
    ActiveFrom DATETIME NOT NULL,
    ActiveTo DATETIME NULL,
    CONSTRAINT FK_MemberBlock_Member FOREIGN KEY (LibraryMemberId) REFERENCES dbo.LibraryMember(Id),
    CONSTRAINT FK_MemberBlock_Branch FOREIGN KEY (LibraryBranchId) REFERENCES dbo.LibraryBranch(Id)
);
GO
CREATE TABLE dbo.MemberQuotaOverride (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    LibraryMemberId INT NOT NULL,
    LibraryBranchId INT NOT NULL,
    MaxCurrentLoans INT NOT NULL,
    MaxCurrentReserves INT NOT NULL,
    LoanDays INT NOT NULL,
    GraceDay INT NOT NULL,
    MaxRenewals INT NOT NULL,
    OverdueFinePerDay DECIMAL(18,2) NOT NULL,
    MaxFinePerItem DECIMAL(18,2) NOT NULL,
    CONSTRAINT FK_MemberQuotaOverride_Member FOREIGN KEY (LibraryMemberId) REFERENCES dbo.LibraryMember(Id),
    CONSTRAINT FK_MemberQuotaOverride_Branch FOREIGN KEY (LibraryBranchId) REFERENCES dbo.LibraryBranch(Id)
);
GO
-- ==============================================================
-- Item catalog
-- ==============================================================
CREATE TABLE dbo.Language (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    LanguageCategory NVARCHAR(100) NOT NULL
);
GO
CREATE TABLE dbo.PublisherInfo (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    PublisherName NVARCHAR(255) NOT NULL
);
GO
CREATE TABLE dbo.SubjectHeading (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Name NVARCHAR(255) NOT NULL,
    Code NVARCHAR(50) NULL
);
GO
CREATE TABLE dbo.ItemCategory (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    ItemCategoryName NVARCHAR(255) NOT NULL,
    ParentId INT NULL,
    CONSTRAINT FK_ItemCategory_Parent FOREIGN KEY (ParentId) REFERENCES dbo.ItemCategory(Id)
);
GO
CREATE TABLE dbo.AuthorInfo (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    AuthorName NVARCHAR(255) NOT NULL
);
GO
CREATE TABLE dbo.ItemInfo (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Title NVARCHAR(500) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    ISBN NVARCHAR(50) NULL,
    PublishDate DATE NULL,
    SubjectHeadingId INT NOT NULL,
    TotalPages INT NULL,
    BindingType NVARCHAR(100) NULL,
    AddedToLibraryDate DATE NOT NULL,
    Keywords NVARCHAR(MAX) NULL,
    LanguageId INT NULL,
    PublisherInfoId INT NULL,
    CONSTRAINT FK_ItemInfo_SubjectHeading FOREIGN KEY (SubjectHeadingId) REFERENCES dbo.SubjectHeading(Id),
    CONSTRAINT FK_ItemInfo_Language FOREIGN KEY (LanguageId) REFERENCES dbo.Language(Id),
    CONSTRAINT FK_ItemInfo_Publisher FOREIGN KEY (PublisherInfoId) REFERENCES dbo.PublisherInfo(Id)
);
GO
CREATE TABLE dbo.AuthorItemInfo (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    AuthorId INT NOT NULL,
    ItemInfoId INT NOT NULL,
    CONSTRAINT FK_AuthorItemInfo_Author FOREIGN KEY (AuthorId) REFERENCES dbo.AuthorInfo(Id),
    CONSTRAINT FK_AuthorItemInfo_ItemInfo FOREIGN KEY (ItemInfoId) REFERENCES dbo.ItemInfo(Id),
    CONSTRAINT UQ_AuthorItemInfo UNIQUE (AuthorId, ItemInfoId)
);
GO
CREATE TABLE dbo.ItemEdition (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    ItemId INT NOT NULL,
    Year INT NOT NULL,
    EditionNumber NVARCHAR(50) NULL,
    CONSTRAINT FK_ItemEdition_ItemInfo FOREIGN KEY (ItemId) REFERENCES dbo.ItemInfo(Id)
);
GO
CREATE TABLE dbo.AccessionPattern (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    LibraryBranchId INT NOT NULL,
    Pattern NVARCHAR(255) NOT NULL,
    NextSequence INT NOT NULL DEFAULT 1,
    CONSTRAINT FK_AccessionPattern_Branch FOREIGN KEY (LibraryBranchId) REFERENCES dbo.LibraryBranch(Id)
);
GO
CREATE TABLE dbo.ItemCopy (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    ItemInfoId INT NOT NULL,
    LibraryBranchId INT NOT NULL,
    LibrarySectionId INT NOT NULL,
    LibraryRackId INT NOT NULL,
    LibraryShelfId INT NOT NULL,
    AccessionPatternId INT NOT NULL,
    AccessionNumber NVARCHAR(100) NOT NULL,
    ConditionLastChecked DATE NULL,
    ConditionRemarks NVARCHAR(MAX) NULL,
    Barcode NVARCHAR(100) NULL,
    UnitCost DECIMAL(18,2) NOT NULL DEFAULT 0,
    CONSTRAINT FK_ItemCopy_ItemInfo FOREIGN KEY (ItemInfoId) REFERENCES dbo.ItemInfo(Id),
    CONSTRAINT FK_ItemCopy_Branch FOREIGN KEY (LibraryBranchId) REFERENCES dbo.LibraryBranch(Id),
    CONSTRAINT FK_ItemCopy_Section FOREIGN KEY (LibrarySectionId) REFERENCES dbo.LibraryItemSection(Id),
    CONSTRAINT FK_ItemCopy_Rack FOREIGN KEY (LibraryRackId) REFERENCES dbo.LibraryRacks(Id),
    CONSTRAINT FK_ItemCopy_Shelf FOREIGN KEY (LibraryShelfId) REFERENCES dbo.LibraryShelf(Id),
    CONSTRAINT FK_ItemCopy_AccessionPattern FOREIGN KEY (AccessionPatternId) REFERENCES dbo.AccessionPattern(Id)
);
GO
CREATE TABLE dbo.ItemCopies (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    ItemCopyId INT NOT NULL,
    EditionId INT NOT NULL,
    NoOfCopies INT NOT NULL DEFAULT 1,
    CONSTRAINT FK_ItemCopies_ItemCopy FOREIGN KEY (ItemCopyId) REFERENCES dbo.ItemCopy(Id),
    CONSTRAINT FK_ItemCopies_Edition FOREIGN KEY (EditionId) REFERENCES dbo.ItemEdition(Id)
);
GO
-- ==============================================================
-- Circulation & Rules
-- ==============================================================
CREATE TABLE dbo.Duration (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Category NVARCHAR(100) NOT NULL,
    Code NVARCHAR(50) NOT NULL,
    Description NVARCHAR(MAX) NULL
);
GO
CREATE TABLE dbo.CirculationRule (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    PartyId INT NOT NULL,
    MaxCurrentLoans INT NOT NULL,
    MaxCurrentReserves INT NOT NULL,
    LoanDays INT NOT NULL,
    GraceDay INT NOT NULL,
    MaxRenewals INT NOT NULL,
    OverdueFinePerDay DECIMAL(18,2) NOT NULL,
    MaxFinePerItem DECIMAL(18,2) NOT NULL,
    LibraryBranchId INT NOT NULL,
    LostChargesItem NVARCHAR(255) NULL,
    DamageValue DECIMAL(18,2) NOT NULL,
    CONSTRAINT FK_CirculationRule_Party FOREIGN KEY (PartyId) REFERENCES dbo.Party(Id),
    CONSTRAINT FK_CirculationRule_Branch FOREIGN KEY (LibraryBranchId) REFERENCES dbo.LibraryBranch(Id)
);
GO
CREATE TABLE dbo.Issuance (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    LibraryMemberId INT NOT NULL,
    ItemCopyId INT NOT NULL,
    DurationId INT NOT NULL,
    IssueDate DATETIME NOT NULL DEFAULT GETDATE(),
    DurationNumber INT NOT NULL,
    FineAccrued DECIMAL(18,2) NOT NULL DEFAULT 0,
    RenewalsUsed INT NOT NULL DEFAULT 0,
    CONSTRAINT FK_Issuance_Member FOREIGN KEY (LibraryMemberId) REFERENCES dbo.LibraryMember(Id),
    CONSTRAINT FK_Issuance_ItemCopy FOREIGN KEY (ItemCopyId) REFERENCES dbo.ItemCopy(Id),
    CONSTRAINT FK_Issuance_Duration FOREIGN KEY (DurationId) REFERENCES dbo.Duration(Id)
);
GO
-- ==============================================================
-- Fines
-- ==============================================================
CREATE TABLE dbo.FineCategory (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    FineCategoryName NVARCHAR(255) NOT NULL
);
GO
CREATE TABLE dbo.FineDefinition (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    FineCategoryId INT NOT NULL,
    ItemCopyId INT NOT NULL,
    CONSTRAINT FK_FineDefinition_Category FOREIGN KEY (FineCategoryId) REFERENCES dbo.FineCategory(Id),
    CONSTRAINT FK_FineDefinition_ItemCopy FOREIGN KEY (ItemCopyId) REFERENCES dbo.ItemCopy(Id)
);
GO
CREATE TABLE dbo.UserFine (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    FineAllocationId INT NOT NULL,
    LibraryMemberId INT NOT NULL,
    FineDefinitionId INT NOT NULL,
    TaxPercentagePerDay DECIMAL(5,2) NOT NULL DEFAULT 0,
    FineAccrued DECIMAL(18,2) NOT NULL DEFAULT 0,
    CONSTRAINT FK_UserFine_Member FOREIGN KEY (LibraryMemberId) REFERENCES dbo.LibraryMember(Id),
    CONSTRAINT FK_UserFine_Definition FOREIGN KEY (FineDefinitionId) REFERENCES dbo.FineDefinition(Id)
);
GO
CREATE TABLE dbo.FineTransaction (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    FineAllocationId INT NOT NULL,
    FineAllocationDate DATETIME NOT NULL DEFAULT GETDATE(),
    LibraryBranchId INT NOT NULL,
    Reason NVARCHAR(500) NULL,
    Amount DECIMAL(18,2) NOT NULL,
    BankAccount NVARCHAR(100) NULL,
    PaidOn DATETIME NULL,
    PaymentRef NVARCHAR(100) NULL,
    CONSTRAINT FK_FineTransaction_Branch FOREIGN KEY (LibraryBranchId) REFERENCES dbo.LibraryBranch(Id)
);
GO
-- ==============================================================
-- Acquisitions / Purchases
-- ==============================================================
CREATE TABLE dbo.AcquisitionRecord (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Type NVARCHAR(100) NOT NULL,
    PartyId INT NOT NULL,
    Invoice NVARCHAR(100) NULL,
    [Date] DATE NOT NULL,
    Amount DECIMAL(18,2) NOT NULL,
    CONSTRAINT FK_AcquisitionRecord_Party FOREIGN KEY (PartyId) REFERENCES dbo.Party(Id)
);
GO
CREATE TABLE dbo.ItemQuotation (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    PartyId INT NOT NULL,
    LibraryRackId INT NOT NULL,
    QuotationDate DATE NOT NULL,
    Amount DECIMAL(18,2) NOT NULL,
    Discount DECIMAL(18,2) NOT NULL DEFAULT 0,
    CONSTRAINT FK_ItemQuotation_Party FOREIGN KEY (PartyId) REFERENCES dbo.Party(Id),
    CONSTRAINT FK_ItemQuotation_Rack FOREIGN KEY (LibraryRackId) REFERENCES dbo.LibraryRacks(Id)
);
GO
CREATE TABLE dbo.PurchaseItem (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    ItemQuotationId INT NULL,
    PurchaseItemDate DATE NOT NULL,
    LibraryItemId INT NOT NULL, -- ItemInfo
    InvoiceNumber NVARCHAR(100) NULL,
    PartyId INT NOT NULL,
    TotalAmount DECIMAL(18,2) NOT NULL,
    Discount DECIMAL(18,2) NOT NULL DEFAULT 0,
    CONSTRAINT FK_PurchaseItem_quotation FOREIGN KEY (ItemQuotationId) REFERENCES dbo.ItemQuotation(Id),
    CONSTRAINT FK_PurchaseItem_ItemInfo FOREIGN KEY (LibraryItemId) REFERENCES dbo.ItemInfo(Id),
    CONSTRAINT FK_PurchaseItem_Party FOREIGN KEY (PartyId) REFERENCES dbo.Party(Id)
);
GO
-- ==============================================================
-- Employees & HR
-- ==============================================================
CREATE TABLE dbo.Employee (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Name NVARCHAR(255) NOT NULL,
    Contact NVARCHAR(100) NULL,
    Code NVARCHAR(50) NULL,
    JoiningDate DATE NOT NULL,
    LeavingDate DATE NULL,
    CurrentRelationHistoryId INT NULL
);
GO
CREATE TABLE dbo.EmployeeRelationHistory (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    EmployeeId INT NOT NULL,
    EffectiveTo DATETIME NOT NULL,
    IsCurrent BIT NOT NULL DEFAULT 0,
    EmployeeType NVARCHAR(100) NULL,
    EmployeeTypeLookupId INT NULL,
    EmployeeCategoryLookupId INT NULL,
    EmployeeStatusId INT NULL,
    EmployeeGrade INT NULL,
    DepartmentId INT NOT NULL,
    DesignationId INT NOT NULL,
    CampusId INT NOT NULL,
    InstituteId INT NOT NULL,
    FacultyId INT NOT NULL,
    ProjectId INT NULL,
    SalaryBankAccountId INT NULL,
    ExpenseAccountId INT NULL,
    SalaryPayable DECIMAL(18,2) NOT NULL DEFAULT 0,
    PayStructureVersionId INT NULL,
    CONSTRAINT FK_EmployeeRelationHistory_Employee FOREIGN KEY (EmployeeId) REFERENCES dbo.Employee(Id),
    CONSTRAINT FK_EmployeeRelationHistory_Department FOREIGN KEY (DepartmentId) REFERENCES dbo.Department(Id),
    CONSTRAINT FK_EmployeeRelationHistory_Designation FOREIGN KEY (DesignationId) REFERENCES dbo.Designation(Id),
    CONSTRAINT FK_EmployeeRelationHistory_Campus FOREIGN KEY (CampusId) REFERENCES dbo.Campus(Id),
    CONSTRAINT FK_EmployeeRelationHistory_Institude FOREIGN KEY (InstituteId) REFERENCES dbo.Institude(Id),
    CONSTRAINT FK_EmployeeRelationHistory_Faculty FOREIGN KEY (FacultyId) REFERENCES dbo.Faculty(Id)
);
GO
-- ==============================================================
-- Miscellaneous / Rooms / Features
-- ==============================================================
CREATE TABLE dbo.Feature (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Name NVARCHAR(255) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    Code NVARCHAR(50) NULL
);
GO
CREATE TABLE dbo.RoomType (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Name NVARCHAR(255) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    Code NVARCHAR(50) NULL
);
GO
CREATE TABLE dbo.RoomTypeAllocation (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    RoomId INT NOT NULL,
    RoomTypeId INT NOT NULL,
    CONSTRAINT FK_RoomTypeAllocation_Room FOREIGN KEY (RoomId) REFERENCES dbo.Room(Id),
    CONSTRAINT FK_RoomTypeAllocation_Type FOREIGN KEY (RoomTypeId) REFERENCES dbo.RoomType(Id),
    CONSTRAINT UQ_RoomTypeAllocation UNIQUE (RoomId, RoomTypeId)
);
GO
CREATE TABLE dbo.RoomFeatureAllocation (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    RoomId INT NOT NULL,
    FeatureId INT NOT NULL,
    FineCategoryId INT NULL,
    CONSTRAINT FK_RoomFeatureAllocation_Room FOREIGN KEY (RoomId) REFERENCES dbo.Room(Id),
    CONSTRAINT FK_RoomFeatureAllocation_Feature FOREIGN KEY (FeatureId) REFERENCES dbo.Feature(Id),
    CONSTRAINT FK_RoomFeatureAllocation_FineCategory FOREIGN KEY (FineCategoryId) REFERENCES dbo.FineCategory(Id)
);
GO
-- ==============================================================
-- Structure / Organization
-- ==============================================================
CREATE TABLE dbo.StructureType (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Name NVARCHAR(255) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    Code NVARCHAR(50) NULL
);
GO
CREATE TABLE dbo.StructureUnit (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedId NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    Name NVARCHAR(255) NOT NULL,
    Code NVARCHAR(50) NULL,
    Level NVARCHAR(100) NULL,
    StructureTypeId INT NOT NULL,
    CONSTRAINT FK_StructureUnit_Type FOREIGN KEY (StructureTypeId) REFERENCES dbo.StructureType(Id)
);
GO
CREATE TABLE dbo.StructureDesignation (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    DesignationId INT NOT NULL,
    StructureUnitId INT NOT NULL,
    CONSTRAINT FK_StructureDesignation_Designation FOREIGN KEY (DesignationId) REFERENCES dbo.Designation(Id),
    CONSTRAINT FK_StructureDesignation_Unit FOREIGN KEY (StructureUnitId) REFERENCES dbo.StructureUnit(Id)
);
GO
-- ==============================================================
-- Students
-- ==============================================================
CREATE TABLE dbo.Student (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    RegistrationNumber NVARCHAR(100) NOT NULL,
    CandidateId INT NULL,
    DegreeProgramId INT NULL,
    DegreeLevelId INT NULL,
    PartyId INT NULL,
    Quota NVARCHAR(50) NULL,
    TimingId INT NULL,
    ProgramSessionId INT NULL,
    CONSTRAINT FK_Student_Party FOREIGN KEY (PartyId) REFERENCES dbo.Party(Id)
);
GO
-- ==============================================================
-- Requisitions, Reservations, Returns, Withdrawals
-- ==============================================================
CREATE TABLE dbo.ItemRequisition (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    LibraryBranchId INT NOT NULL,
    ItemInfoId INT NOT NULL,
    Quantity INT NOT NULL,
    LibraryRackId INT NOT NULL,
    EstimateCost DECIMAL(18,2) NOT NULL DEFAULT 0,
    CONSTRAINT FK_ItemRequisition_Branch FOREIGN KEY (LibraryBranchId) REFERENCES dbo.LibraryBranch(Id),
    CONSTRAINT FK_ItemRequisition_ItemInfo FOREIGN KEY (ItemInfoId) REFERENCES dbo.ItemInfo(Id),
    CONSTRAINT FK_ItemRequisition_Rack FOREIGN KEY (LibraryRackId) REFERENCES dbo.LibraryRacks(Id)
);
GO
CREATE TABLE dbo.LibraryRequisition (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    ItemInfoId INT NOT NULL,
    LibrarianInfoId INT NULL,
    LibraryBranchId INT NOT NULL,
    EmployeeId INT NULL,
    [Date] DATE NOT NULL,
    Purpose NVARCHAR(MAX) NULL,
    CONSTRAINT FK_LibraryRequisition_ItemInfo FOREIGN KEY (ItemInfoId) REFERENCES dbo.ItemInfo(Id),
    CONSTRAINT FK_LibraryRequisition_Librarian FOREIGN KEY (LibrarianInfoId) REFERENCES dbo.LibrarianInfo(Id),
    CONSTRAINT FK_LibraryRequisition_Branch FOREIGN KEY (LibraryBranchId) REFERENCES dbo.LibraryBranch(Id),
    CONSTRAINT FK_LibraryRequisition_Employee FOREIGN KEY (EmployeeId) REFERENCES dbo.Employee(Id)
);
GO
CREATE TABLE dbo.ReserveItem (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    ItemInfoId INT NOT NULL,
    DurationId INT NULL,
    NumberDuration NVARCHAR(50) NULL,
    LibraryMemberId INT NOT NULL,
    IsAvailable BIT NOT NULL DEFAULT 1,
    ExpiryDate DATETIME NOT NULL,
    CONSTRAINT FK_ReserveItem_ItemInfo FOREIGN KEY (ItemInfoId) REFERENCES dbo.ItemInfo(Id),
    CONSTRAINT FK_ReserveItem_Duration FOREIGN KEY (DurationId) REFERENCES dbo.Duration(Id),
    CONSTRAINT FK_ReserveItem_Member FOREIGN KEY (LibraryMemberId) REFERENCES dbo.LibraryMember(Id)
);
GO
CREATE TABLE dbo.ReturnItem (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    LibraryItemId INT NOT NULL, -- ItemCopy
    PurchaseItemId INT NULL,
    IssuanceId INT NULL,
    ReturnDate DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_ReturnItem_ItemCopy FOREIGN KEY (LibraryItemId) REFERENCES dbo.ItemCopy(Id),
    CONSTRAINT FK_ReturnItem_PurchaseItem FOREIGN KEY (PurchaseItemId) REFERENCES dbo.PurchaseItem(Id),
    CONSTRAINT FK_ReturnItem_Issuance FOREIGN KEY (IssuanceId) REFERENCES dbo.Issuance(Id)
);
GO
CREATE TABLE dbo.Withdrawal (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    ItemCopyId INT NOT NULL,
    [Date] DATE NOT NULL,
    LibraryId INT NOT NULL, -- LibraryBranch
    Reason NVARCHAR(MAX) NULL,
    EmployeeId INT NULL,
    CONSTRAINT FK_Withdrawal_ItemCopy FOREIGN KEY (ItemCopyId) REFERENCES dbo.ItemCopy(Id),
    CONSTRAINT FK_Withdrawal_Branch FOREIGN KEY (LibraryId) REFERENCES dbo.LibraryBranch(Id),
    CONSTRAINT FK_Withdrawal_Employee FOREIGN KEY (EmployeeId) REFERENCES dbo.Employee(Id)
);
GO
-- ==============================================================
-- ItemCondition
-- ==============================================================
CREATE TABLE dbo.ItemCondition (
    Id INT IDENTITY\(1,1\) PRIMARY KEY,
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedBy NVARCHAR(255) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedBy NVARCHAR(255) NULL,
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    DeletedBy NVARCHAR(255) NULL,
    DeletedAt DATETIME NULL,

    ItemId INT NOT NULL,
    ItemCopyId INT NOT NULL,
    ItemCategoryId INT NOT NULL,
    ConditionDescription NVARCHAR(MAX) NULL,
    CONSTRAINT FK_ItemCondition_ItemInfo FOREIGN KEY (ItemId) REFERENCES dbo.ItemInfo(Id),
    CONSTRAINT FK_ItemCondition_ItemCopy FOREIGN KEY (ItemCopyId) REFERENCES dbo.ItemCopy(Id),
    CONSTRAINT FK_ItemCondition_Category FOREIGN KEY (ItemCategoryId) REFERENCES dbo.ItemCategory(Id)
);
GO