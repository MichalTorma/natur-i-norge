from sqlalchemy import Column, Text, Integer, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
Base = declarative_base()

class Language(Base):
    '''Table defining supported languages - alle tables ending with 'Info'
    reference this table.'''

    __tablename__ = 'Language'
    _id = Column(Integer, primary_key=True)
    name = Column(Text)
    # majorTypeGroupInfo = relationship('MajorTypeGroupInfo', back_populates='language')
    # majorTypeInfo = relationship('MajorTypeInfo', back_populates='language')
    # minorTypeInfo = relationship('MinorTypeInfo', back_populates='language')
    # lecInfo = relationship('LECInfo', back_populates='language')
    # patternOfVariationInfo = relationship('PatternOfVariationInfo', back_populates='language')
    # structuringProcessInfo = relationship('StructuringProcessInfo', back_populates='language')
    # lecCombinationTypeInfo = relationship('LECCombinationTypeInfo', back_populates='language')

class MajorTypeGroup(Base):
    '''Table of Major type groups lie T,V,M etc..'''

    __tablename__ = "MajorTypeGroup"
    _id = Column(Text, primary_key=True)

    # References
    info = relationship('MajorTypeGroupInfo', back_populates='majorTypeGroup')
    majorType = relationship('MajorType', back_populates='majorTypeGroup')

class MajorTypeGroupInfo(Base):
    '''Language specific information about major type groups.'''

    __tablename__ = 'MajorTypeGroupInfo'
    majorTypeGroup_id = Column(Text, ForeignKey('MajorTypeGroup._id'), primary_key=True)
    language_id = Column(Integer, ForeignKey('Language._id'), primary_key=True)
    name = Column(Text)
    description = Column(Text)

    # References
    language = relationship('Language')
    majorTypeGroup = relationship('MajorTypeGroup', back_populates='info')

class MajorType(Base):
    '''Major types like T4,V11 and so on, references major type.'''

    __tablename__ = 'MajorType'
    _id = Column(Integer, primary_key=True)
    majorTypeGroup_id = Column(Text, ForeignKey('MajorTypeGroup._id'))

    # References
    majorTypeGroup = relationship('MajorTypeGroup', back_populates='majorType')
    info = relationship('MajorTypeInfo', back_populates='majorType')
    lec = relationship('MajorTypeLEC', back_populates='majorType')

class MajorTypeInfo(Base):
    '''Language specific information about major types'''

    __tablename__ = 'MajorTypeInfo'
    language_id = Column(Integer, ForeignKey('Language._id'), primary_key=True)
    majorType_id = Column(Integer, ForeignKey('MajorType._id'), primary_key=True)
    name = Column(Text)
    description = Column(Text)

    # References
    language = relationship('Language')
    majorType = relationship('MajorType', back_populates='majorType')

class MinorType(Base):
    '''Minor types like T4-1 '''

    __tablename__ = 'MinorType'
    _id = Column(Integer, primary_key=True)
    majorType_id = Column(Integer, ForeignKey('MajorType._id'))

    # References
    elementarySegment = relationship('elementarySegment', back_populates='minorType')
    info = relationship('MinorTypeInfo', back_populates='minorType')

class MinorTypeInfo(Base):
    '''Language specific info about minor types'''

    __tablename__ = 'MinorTypeInfo'
    minorType_id = Column(Integer, ForeignKey('MinorType._id'), primary_key=True)
    language_id = Column(Integer, ForeignKey('Language._id'), primary_key=True)
    name = Column(Text)

    # References
    minorType = relationship('MinorType', back_populates='info')
    language = relationship('Language')

class LEC(Base):
    '''Local environmental complex-gradients with their descriptions'''

    __tablename__ = 'LEC'
    _id = Column(Text, primary_key=True)
    spatialScale = Column(Integer)
    structuringProcess_id = Column(Text, ForeignKey('StructuringProcess._id'))

    # References
    elementarySegment = relationship('ElementarySegment', back_populates='lec')
    structuringProcess = relationship('StructuringProcess', back_populates='lec')
    patternOfVariation = relationship('PatternOfVariation', back_populates='lec')
    info = relationship('LECInfo', backref='lec')
    majorTypeLEC = relationship('MajorTypeLEC', back_populates='lec')
    minorTypeLEC = relationship('MajorTypeLEC', back_populates='lec')

class LECInfo(Base):
    '''Language specific info about local environmental complex gradients'''

    __tablename__ = 'LECInfo'
    language_id = Column(Integer, ForeignKey('Language._id'), primary_key=True)
    lec_id = Column(Text, ForeignKey('LEC._id'), primary_key=True)
    name = Column(Text)
    description = Column(Text)

    # References
    lec = relationship('LEC', back_populates='info')
    language = relationship('Language')

class StructuringProcess(Base):
    '''category of structuring process of local environmental complex-gradient'''

    __tablename__ = 'StructuringProcess'
    _id = Column(Text, primary_key=True)
    lec = relationship('LEC', backref='structuringProcess')
    info = relationship('StructuringProcessInfo', backref='structuringProcess')

class StructuringProcessInfo(Base):
    '''Language specific information about category of structuring process'''

    __tablename__ = 'StructuringProcessInfo'
    language_id = Column(Integer, ForeignKey('Language._id'), primary_key=True)
    structuringProcess_id = Column(Text, ForeignKey('StructuringProcess._id'), primary_key=True)
    name = Column(Text)
    description = Column(Text)

    # References
    language = relationship('Language')
    StructuringProcess = relationship('StructuringProcess', back_populates='info')

class PatternOfVariation(Base):
    '''pattern of variation (f = factor; g = gradient, ga = gradient that
    ends in a species-thinning situation at high intensity)'''

    __tablename__ = 'PatternOfVariation'
    _id = Column(Text, primary_key=True)
    lec_id = Column(Text, ForeignKey('LEC._id'))

    # References
    lec = relationship('LEC', back_populates='patternOfVariation')
    info = relationship('PatternOfVariationInfo', back_populates='patternOfVariation')

class PatternOfVariationInfo(Base):
    '''Language specific information about the pattern of variation'''

    __tablename__ = 'PatternOfVariationInfo'
    language_id = Column(Integer, ForeignKey('Language._id'), primary_key=True)
    patternOfVariation_id = Column(Text, ForeignKey('PatternOfVariation._id'), primary_key=True)
    name = Column(Text)
    description = Column(Text)

    # References
    patternOfVariation = relationship('PatternOfVariation', back_populates='info')
    language = relationship('Language')

class MajorTypeLEC(Base):
    '''Association table for LEC and major types'''

    __tablename__ = 'MajorTypeLEC'
    lec_id = Column(Text, ForeignKey('LEC._id'), primary_key=True)
    majorType_id = Column(Text, ForeignKey('MajorType._id', primary_key=True))

    # References
    majorType = relationship('MajorType', back_populates='lec')
    lec = relationship('LEC', back_populates='majorType')

class MinorTypeLEC(Base):
    '''Association table for LEC and minor types'''

    __tablename__ = 'MinorTypeLEC'
    lec_id = Column(Text, ForeignKey('LEC._id'), primary_key=True)
    minorType_id = Column(Text, ForeignKey('MinorType._id'), primary_key=True)

    # References
    lec = relationship('LEC', back_populates='minorType')
    minorType = relationship('MinorType', back_populates='lec')

class LECCombination(Base):
    ''' Categories of LECs based on their role in type-hierarchy construction'''

    __tablename__ = 'LECCombination'
    _id = Column(Integer, primary_key=True)
    lecCombinationType_id = Column(Text, ForeignKey('LECCombinationType._id'))

    # References
    lecs = relationship('LECCombinationLEC', back_populates='lecCombination')

class LECCombinationLEC(Base):
    ''' Association table for LEC in every LECCombination'''

    __tablename__ = 'LECCombinationLEC'
    lecCombination_id = Column(Integer, ForeignKey('LECCombination._id'), primary_key=True)
    lec_id = Column(Text, ForeignKey('LEC._id'), primary_key=True)
    order = Column(Integer)

    # References
    lecCombination = relationship('LECCombination', back_populates='lecs')
    lecs = relationship('LEC')

class LECCombinationType(Base):
    ''' LEC categories types like dLEC, mLEC, iLEC and so on'''

    __tablename__ = 'LECCombinationType'
    _id = Column(Text, primary_key=True)

class LECCombinationTypeInfo(Base):
    ''' Language dependant info about LEC categories types'''

    __tablename__ = 'LECCombinationTypeInfo'
    lecCombinationType_id = Column(Text, ForeignKey('LECCombinationType._id'), primary_key=True)
    language_id = Column(Integer, ForeignKey('Language._id'), primary_key=True)
    description = Column(Text)

    # References
    lecCombinationTypes = relationship('LECCombinationType', back_populates='info')
    language = relationship('Language')

class ElementarySegment(Base):
    '''elementary segments of individual LECs like KA.a, VT.b'''

    __tablename__ = 'ElementarySegment'
    _id = Column(Integer, primary_key=True)
    lec_id = Column(Text, ForeignKey('LEC._id'))
    order = Column(Integer)

    # References
    lec = relationship('LEC', 'elementarySegment')

class ElementarySegmentKey(Base):
    ''' Possible GAD values for elementary segments'''

    __tablename__ = 'ElementarySegmentKey'
    _id = Column(Integer, primary_key=True)
    elementarySegment_id = Column(Integer, ForeignKey('ElementarySegment._id'))
    key = Column(Text)
    value = Column(Integer)

    # References
    elementarySegment = relationship('ElementarySegment')

class StandardSegmentElement(Base):
    ''' Association table that connects standard segments and elementary segments'''

    __tablename__ = 'StandardSegmentElement'
    standardSegment_id = Column(Integer, ForeignKey('StandardSegment._id'), primary_key=True)
    elementarySegment_id = Column(Integer, ForeignKey('ElementarySegment._id'), primary_key=True)

    # References
    elementarySegment = relationship('standardSegment')

class StandardSegment(Base):
    ''' Standard segments for LACCategorie. They consist of Elementary segments'''

    __tablename__ = 'StandardSegment'
    _id = Column(Integer, primary_key=True)
    minorType_id = Column(Integer, ForeignKey('MinorType._id'))
    lec_id = Column(Text, ForeignKey('LEC._id'))

    # References
    elementarySegments = relationship('StandardSegmentElement')
    lec = relationship('LEC')

class GadValue(Base):
    __tablename__ = 'GadValue'
    _id = Column(Integer, primary_key=True)
    gad_id = Column(Integer, ForeignKey('GAD._id'))
    majorType_id = Column(Integer, ForeignKey('MajorType._id'))
    elementarySegmentGroup_id = Column(Integer, ForeignKey('ElementarySegmentGroup._id'))
    m7Scale_id = Column(Integer, ForeignKey('GadScale.m7Scale'))

    # References
    gad = relationship('GAD', back_populates='values')
    elementarySegmentGroup = relationship('elementarySegmentGroup')
    m7Scale = relationship('GadScale')

class GadScale(Base):
    ''' Collection of M7 and M3 scales with constancy'''

    __tablename__ = 'GadScale'
    m7Scale = Column(Integer, primary_key=True)
    m3Scale = Column(Integer)
    Constancy = Column(Text)

class ElementarySegmentGroup(Base):
    ''' Association between elementary segmenta and elementary segment group used in GAD'''

    __tablename__ = 'ElementarySegmentGroup'
    _id = Column(Integer, primary_key=True)
    elementarySegment_id = Column(Integer, ForeignKey('ElementarySegment._id'), primary_key=True)
    lecCombination_id = Column(Integer, ForeignKey('LECCombination._id'), primary_key=True)

    # References
    elementarySegment = relationship('ElementarySegment')

class GAD(Base):
    __tablename__ = 'GAD'
    _id = Column(Integer, primary_key=True)
    artsKode = Column(Text)
    norskNavn = Column(Text)
    latinName = Column(Text)

    # References
    values = relationship('GadValue', back_populates='gad')

