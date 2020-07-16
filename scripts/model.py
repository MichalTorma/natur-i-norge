from sqlalchemy import Column, Text, Integer, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
Base = declarative_base()
preffix = 'nin_'

class Language(Base):
    '''Table defining supported languages - alle tables ending with 'Info'
    reference this table.'''

    __tablename__ = f'{preffix}Language'
    _id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(Text)
    majorTypeGroupInfo = relationship('MajorTypeGroupInfo', back_populates='language')
    majorTypeInfo = relationship('MajorTypeInfo', back_populates='language')
    minorTypeInfo = relationship('MinorTypeInfo', back_populates='language')
    lecInfo = relationship('LECInfo', back_populates='language')
    patternOfVariationInfo = relationship('PatternOfVariationInfo', back_populates='language')
    structuringProcessInfo = relationship('StructuringProcessInfo', back_populates='language')
    lecCombinationTypeInfo = relationship('LECCombinationTypeInfo', back_populates='language')

class MajorTypeGroup(Base):
    '''Table of Major type groups lie T,V,M etc..'''

    __tablename__ = f'{preffix}MajorTypeGroup'
    _id = Column(Text, primary_key=True)

    # References
    info = relationship('MajorTypeGroupInfo')
    majorType = relationship('MajorType', back_populates='majorTypeGroup')

class MajorTypeGroupInfo(Base):
    '''Language specific information about major type groups.'''

    __tablename__ = f'{preffix}MajorTypeGroupInfo'
    majorTypeGroup_id = Column(Text, ForeignKey(f'{preffix}MajorTypeGroup._id'), primary_key=True)
    language_id = Column(Integer, ForeignKey(f'{preffix}Language._id'), primary_key=True)
    name = Column(Text)
    description = Column(Text)

    # References
    language = relationship('Language', back_populates='majorTypeGroupInfo')
    majorTypeGroup = relationship('MajorTypeGroup', back_populates='info')

class MajorType(Base):
    '''Major types like T4,V11 and so on, references major type.'''

    __tablename__ = f'{preffix}MajorType'
    _id = Column(Integer, primary_key=True, autoincrement=True)
    majorTypeGroup_id = Column(Text, ForeignKey(f'{preffix}MajorTypeGroup._id'))

    # References
    lecCombination = relationship('LECCombination', back_populates='majorType')
    majorTypeGroup = relationship('MajorTypeGroup', back_populates='majorType')
    info = relationship('MajorTypeInfo', back_populates='majorType')
    lec = relationship('MajorTypeLEC', back_populates='majorType')

class MajorTypeInfo(Base):
    '''Language specific information about major types'''

    __tablename__ = f'{preffix}MajorTypeInfo'
    language_id = Column(Integer, ForeignKey(f'{preffix}Language._id'), primary_key=True)
    majorType_id = Column(Integer, ForeignKey(f'{preffix}MajorType._id'), primary_key=True)
    name = Column(Text)
    description = Column(Text)

    # References
    language = relationship('Language')
    majorType = relationship('MajorType', back_populates='info')

class MinorType(Base):
    '''Minor types like T4-1 '''

    __tablename__ = f'{preffix}MinorType'
    _id = Column(Integer, primary_key=True)
    majorType_id = Column(Integer, ForeignKey(f'{preffix}MajorType._id'))

    # References
    info = relationship('MinorTypeInfo', back_populates='minorType')
    lec = relationship('MinorTypeLEC', back_populates='minorType')

class MinorTypeInfo(Base):
    '''Language specific info about minor types'''

    __tablename__ = f'{preffix}MinorTypeInfo'
    minorType_id = Column(Integer, ForeignKey(f'{preffix}MinorType._id'), primary_key=True)
    language_id = Column(Integer, ForeignKey(f'{preffix}Language._id'), primary_key=True)
    name = Column(Text)

    # References
    minorType = relationship('MinorType', back_populates='info')
    language = relationship('Language')

class LEC(Base):
    '''Local environmental complex-gradients with their descriptions'''

    __tablename__ = f'{preffix}LEC'
    _id = Column(Text, primary_key=True)
    spatialScale = Column(Integer)
    structuringProcess_id = Column(Text, ForeignKey(f'{preffix}StructuringProcess._id'))
    patternOfVariation_id =  Column(Text, ForeignKey(f'{preffix}PatternOfVariation._id'))
    knowledgeBaseRelations = Column(Integer)
    knowledgeBaseDivision = Column(Integer)

    # References
    elementarySegment = relationship('ElementarySegment', back_populates='lec')
    structuringProcess = relationship('StructuringProcess', back_populates='lec')
    patternOfVariation = relationship('PatternOfVariation', back_populates='lec')
    info = relationship('LECInfo', back_populates='lec')
    majorType = relationship('MajorTypeLEC', back_populates='lec')
    minorType = relationship('MinorTypeLEC', back_populates='lec')

class LECInfo(Base):
    '''Language specific info about local environmental complex gradients'''

    __tablename__ = f'{preffix}LECInfo'
    language_id = Column(Integer, ForeignKey(f'{preffix}Language._id'), primary_key=True)
    lec_id = Column(Text, ForeignKey(f'{preffix}LEC._id'), primary_key=True)
    name = Column(Text)
    description = Column(Text)

    # References
    lec = relationship('LEC', back_populates='info')
    language = relationship('Language')

class StructuringProcess(Base):
    '''category of structuring process of local environmental complex-gradient'''

    __tablename__ = f'{preffix}StructuringProcess'
    _id = Column(Text, primary_key=True)
    lec = relationship('LEC', back_populates='structuringProcess')
    info = relationship('StructuringProcessInfo', back_populates='structuringProcess')

class StructuringProcessInfo(Base):
    '''Language specific information about category of structuring process'''

    __tablename__ = f'{preffix}StructuringProcessInfo'
    language_id = Column(Integer, ForeignKey(f'{preffix}Language._id'), primary_key=True)
    structuringProcess_id = Column(Text, ForeignKey(f'{preffix}StructuringProcess._id'), primary_key=True)
    name = Column(Text)
    description = Column(Text)

    # References
    language = relationship('Language')
    structuringProcess = relationship('StructuringProcess', back_populates='info')

class PatternOfVariation(Base):
    '''pattern of variation (f = factor; g = gradient, ga = gradient that
    ends in a species-thinning situation at high intensity)'''

    __tablename__ = f'{preffix}PatternOfVariation'
    _id = Column(Text, primary_key=True)

    # References
    lec = relationship('LEC', back_populates='patternOfVariation')
    info = relationship('PatternOfVariationInfo', back_populates='patternOfVariation')

class PatternOfVariationInfo(Base):
    '''Language specific information about the pattern of variation'''

    __tablename__ = f'{preffix}PatternOfVariationInfo'
    language_id = Column(Integer, ForeignKey(f'{preffix}Language._id'), primary_key=True)
    patternOfVariation_id = Column(Text, ForeignKey(f'{preffix}PatternOfVariation._id'), primary_key=True)
    name = Column(Text)
    description = Column(Text)

    # References
    patternOfVariation = relationship('PatternOfVariation', back_populates='info')
    language = relationship('Language')

class MajorTypeLEC(Base):
    '''Association table for LEC and major types'''

    __tablename__ = f'{preffix}MajorTypeLEC'
    lec_id = Column(Text, ForeignKey(f'{preffix}LEC._id'), primary_key=True)
    majorType_id = Column(Text, ForeignKey(f'{preffix}MajorType._id', primary_key=True))

    # References
    majorType = relationship('MajorType', back_populates='lec')
    lec = relationship('LEC', back_populates='majorType')

class MinorTypeLEC(Base):
    '''Association table for LEC and minor types'''

    __tablename__ = f'{preffix}MinorTypeLEC'
    lec_id = Column(Text, ForeignKey(f'{preffix}LEC._id'), primary_key=True)
    minorType_id = Column(Text, ForeignKey(f'{preffix}MinorType._id'), primary_key=True)

    # References
    lec = relationship('LEC', back_populates='minorType')
    minorType = relationship('MinorType', back_populates='lec')
class LECCombination(Base):
    ''' Categories of LECs based on their role in type-hierarchy construction'''

    __tablename__ = f'{preffix}LECCombination'
    _id = Column(Integer, primary_key=True, autoincrement=True)
    lecCombinationType_id = Column(Text, ForeignKey(f'{preffix}LECCombinationType._id'))
    majorType_id = Column(Text, ForeignKey(f'{preffix}MajorType._id'))

    # References
    lecs = relationship('LECCombinationLEC', back_populates='lecCombination')
    majorType = relationship('MajorType', back_populates='lecCombination')

class LECCombinationLEC(Base):
    ''' Association table for LEC in every LECCombination'''

    __tablename__ = f'{preffix}LECCombinationLEC'
    lecCombination_id = Column(Integer, ForeignKey(f'{preffix}LECCombination._id'), primary_key=True)
    lec_id = Column(Text, ForeignKey(f'{preffix}LEC._id'), primary_key=True)
    order = Column(Integer)

    # References
    lecCombination = relationship('LECCombination', back_populates='lecs')
    lecs = relationship('LEC')

class LECCombinationType(Base):
    ''' LEC categories types like dLEC, mLEC, iLEC and so on'''

    __tablename__ = f'{preffix}LECCombinationType'
    _id = Column(Text, primary_key=True)

    # References
    info = relationship('LECCombinationTypeInfo')

class LECCombinationTypeInfo(Base):
    ''' Language dependant info about LEC categories types'''

    __tablename__ = f'{preffix}LECCombinationTypeInfo'
    lecCombinationType_id = Column(Text, ForeignKey(f'{preffix}LECCombinationType._id'), primary_key=True)
    language_id = Column(Integer, ForeignKey(f'{preffix}Language._id'), primary_key=True)
    description = Column(Text)

    # References
    lecCombinationTypes = relationship('LECCombinationType', back_populates='info')
    language = relationship('Language')

class ElementarySegment(Base):
    '''elementary segments of individual LECs like KA.a, VT.b'''

    __tablename__ = f'{preffix}ElementarySegment'
    _id = Column(Integer, primary_key=True, autoincrement=True)
    lec_id = Column(Text, ForeignKey(f'{preffix}LEC._id'))
    value = Column(Text)
    order = Column(Integer)

    # References
    lec = relationship('LEC', back_populates='elementarySegment')

class StandardSegmentElement(Base):
    ''' Association table that connects standard segments and elementary segments'''

    __tablename__ = f'{preffix}StandardSegmentElement'
    standardSegment_id = Column(Integer, ForeignKey(f'{preffix}StandardSegment._id'), primary_key=True)
    elementarySegment_id = Column(Integer, ForeignKey(f'{preffix}ElementarySegment._id'), primary_key=True)

    # References
    elementarySegment = relationship('StandardSegment')

class StandardSegment(Base):
    ''' Standard segments for LACCategorie. They consist of Elementary segments'''

    __tablename__ = f'{preffix}StandardSegment'
    _id = Column(Integer, primary_key=True, autoincrement=True)
    minorType_id = Column(Integer, ForeignKey(f'{preffix}MinorType._id'))
    lec_id = Column(Text, ForeignKey(f'{preffix}LEC._id'))

    # References
    elementarySegments = relationship('StandardSegmentElement')
    lec = relationship('LEC')

class GadValueElementarySegment(Base):
    __tablename__ = f'{preffix}GadValueElementarySegment'
    gad_id = Column(Integer, ForeignKey(f'{preffix}GadValue._id'), primary_key=True)
    elementarySegment_id = Column(Integer, ForeignKey(f'{preffix}ElementarySegment._id'), primary_key=True)

    # References
    gadValue = relationship('GadValue', back_populates='elementarySegment')
    elementarySegment = relationship('ElementarySegment')

class GadValue(Base):
    __tablename__ = f'{preffix}GadValue'
    _id = Column(Integer, primary_key=True, autoincrement=True)
    gad_id = Column(Integer, ForeignKey(f'{preffix}GAD.artsKode'))
    majorType_id = Column(Integer, ForeignKey(f'{preffix}MajorType._id'))
    m7Scale_id = Column(Integer, ForeignKey(f'{preffix}GadScale.m7Scale'))
    lecCombination_id = Column(Integer, ForeignKey(f'{preffix}LECCombination._id'))

    # References
    gad = relationship('GAD', back_populates='values')
    elementarySegment = relationship('GadValueElementarySegment', back_populates='gadValue')
    m7Scale = relationship('GadScale')
    lecCombination = relationship('LECCombination')

class GadScale(Base):
    ''' Collection of M7 and M3 scales with constancy'''

    __tablename__ = f'{preffix}GadScale'
    m7Scale = Column(Integer, primary_key=True)
    m3Scale = Column(Integer)
    Constancy = Column(Text)

class GAD(Base):
    __tablename__ = f'{preffix}GAD'
    artsKode = Column(Text, primary_key=True)
    norskNavn = Column(Text)
    latinName = Column(Text)

    # References
    values = relationship('GadValue', back_populates='gad')

