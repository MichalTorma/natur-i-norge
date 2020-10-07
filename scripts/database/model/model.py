from jinja2.nodes import For
from sqlalchemy import Column, Text, Integer, ForeignKey
from sqlalchemy.orm import relation, relationship
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.sql.sqltypes import String
Base = declarative_base()
prefix = 'nin_'


class Language(Base):
    '''Table defining supported languages - alle tables ending with 'Info'
    reference this table.'''

    __tablename__ = f'{prefix}Language'
    _id = Column(Text, primary_key=True)
    name = Column(Text)


class Detail(Base):
    '''Key value pairs for details'''

    __tablename__ = f'{prefix}Detail'
    _id = Column(Text, primary_key=True)
    language_id = Column(Text, ForeignKey(
        f'{prefix}Language._id'), primary_key=True)
    key = Column(Text, primary_key=True)
    value = Column(Text)


class MajorTypeGroup(Base):
    '''Table of Major type groups lie T,V,M etc..'''

    __tablename__ = f'{prefix}MajorTypeGroup'
    _id = Column(Text, primary_key=True)
    detail_id = Column(Text, ForeignKey(f'{prefix}Detail._id'))

    # References
    majorType = relationship('MajorType', back_populates='majorTypeGroup')


class MajorType(Base):
    '''Major types like T4,V11 and so on, references major type.'''

    __tablename__ = f'{prefix}MajorType'
    _id = Column(Text, primary_key=True,)
    majorTypeGroup_id = Column(Text, ForeignKey(f'{prefix}MajorTypeGroup._id'))
    order = Column(Integer)
    detail_id = Column(Text, ForeignKey(f'{prefix}Detail._id'))

    # References
    majorTypeGroup = relationship('MajorTypeGroup', back_populates='majorType')
    lec = relationship('MajorTypeLEC', back_populates='majorType')


class MinorType(Base):
    '''Minor types like T4-1 '''

    __tablename__ = f'{prefix}MinorType'
    _id = Column(Text, primary_key=True)
    order = Column(Integer)
    majorType_id = Column(Text, ForeignKey(f'{prefix}MajorType._id'))
    detail_id = Column(Text, ForeignKey(f'{prefix}Detail._id'))

    # References
    standardSegments = relationship('MinorTypeStandardSegment')
    minorTypeScaled = relationship('MinorTypeScaled')


class MinorTypeStandardSegment(Base):
    '''Minor type association with standard segments and Minor types'''

    __tablename__ = f'{prefix}MinorTypeStandardSegment'
    minorType_id = Column(Text, ForeignKey(
        f'{prefix}MinorType._id'), primary_key=True)
    standardSegment_id = Column(Text, ForeignKey(
        f'{prefix}StandardSegment._id'), primary_key=True)

    # References
    minorType = relationship('MinorType', back_populates='standardSegments')
    standardSegment = relationship('StandardSegment')


class MinorTypeScaled(Base):
    '''Minor type association with scale'''

    __tablename__ = f'{prefix}MinorTypeScaled'
    _id = Column(Text, primary_key=True)
    minorType_id = Column(Text, ForeignKey(
        f'{prefix}MinorType._id'), primary_key=True)
    mappingScale_id = Column(Integer, ForeignKey(f'{prefix}MappingScale._id'))

    # References
    minorType = relationship('MinorType', back_populates='minorTypeScaled')


class MappingScale(Base):
    '''Mapping scale used'''

    __tablename__ = f'{prefix}MappingScale'
    _id = Column(Integer, primary_key=True)
    name = Column(Text)


class LEC(Base):
    '''Local environmental complex-gradients with their descriptions'''

    __tablename__ = f'{prefix}LEC'
    _id = Column(Text, primary_key=True)
    parentLec_id = Column(Text, ForeignKey(f'{prefix}LEC._id'))
    structuringProcess_id = Column(
        Text, ForeignKey(f'{prefix}StructuringProcess._id'))
    patternOfVariation_id = Column(
        Text, ForeignKey(f'{prefix}PatternOfVariation._id'))
    knowledgeBaseRelations = Column(Integer)
    knowledgeBaseDivision = Column(Integer)
    spatialScale = Column(Integer)
    detail_id = Column(Text, ForeignKey(f'{prefix}Detail._id'))

    # References
    childLec = relationship('LEC', back_populates='parentLec')
    parentLec = relationship('LEC')
    # elementarySegment = relationship('ElementarySegment', back_populates='lec')
    structuringProcess = relationship(
        'StructuringProcess', back_populates='lec')
    patternOfVariation = relationship(
        'PatternOfVariation', back_populates='lec')
    majorType = relationship('MajorTypeLEC', back_populates='lec')


class StructuringProcess(Base):
    '''category of structuring process of local environmental complex-gradient'''

    __tablename__ = f'{prefix}StructuringProcess'
    _id = Column(Text, primary_key=True)
    detail_id = Column(Text, ForeignKey(f'{prefix}Detail._id'))

    # References
    lec = relationship('LEC', back_populates='structuringProcess')


class PatternOfVariation(Base):
    '''pattern of variation (f = factor; g = gradient, ga = gradient that
    ends in a species-thinning situation at high intensity)'''

    __tablename__ = f'{prefix}PatternOfVariation'
    _id = Column(Text, primary_key=True)
    detail_id = Column(Text, ForeignKey(f'{prefix}Detail._id'))

    # References
    lec = relationship('LEC', back_populates='patternOfVariation')


class MajorTypeLEC(Base):
    '''Association table for LEC and major types'''

    __tablename__ = f'{prefix}MajorTypeLEC'
    _id = Column(Text, primary_key=True)
    lec_id = Column(Text, ForeignKey(f'{prefix}LEC._id'))
    majorType_id = Column(Text, ForeignKey(f'{prefix}MajorType._id'))
    lecType_id = Column(Text, ForeignKey(f'{prefix}LECType._id'))
    axis = Column(Integer)

    # References
    majorType = relationship('MajorType', back_populates='lec')
    lec = relationship('LEC', back_populates='majorType')
    standardSegment = relationship('StandardSegment')


class LECType(Base):
    ''' LEC categories types like dLEC, mLEC, iLEC and so on'''

    __tablename__ = f'{prefix}LECType'
    _id = Column(Text, primary_key=True)
    detail_id = Column(Text, ForeignKey(f'{prefix}Detail._id'))


class ElementarySegment(Base):
    __tablename__ = f'{prefix}ElementarySegment'
    _id = Column(Text, primary_key=True)
    lec_id = Column(Text, ForeignKey(f'{prefix}LEC._id'))
    value = Column(Text, primary_key=True)
    order = Column(Integer)


class ElementarySegmentGroup(Base):
    __tablename__ = f'{prefix}ElementarySegmentGroup'
    _id = Column(Text, primary_key=True)
    elementarySegment_id = Column(Text, ForeignKey(
        f'{prefix}ElementarySegment._id'), primary_key=True)


class ElementarySegmentGroupDetail(Base):
    '''elementary segments of individual LECs like KA.a, VT.b'''

    __tablename__ = f'{prefix}ElementarySegmentGroupDetail'
    elementarySegmentGroup_id = Column(Text, ForeignKey(
        f'{prefix}ElementarySegmentGroup.elementarySegment_id'), primary_key=True)
    lec_id = Column(Text, ForeignKey(f'{prefix}LEC._id'))
    value = Column(Text)
    detail_id = Column(Text, ForeignKey(f'{prefix}Detail._id'))

    # References
    # lec = relationship('LEC', back_populates='elementarySegment')


class StandardSegmentElement(Base):
    ''' Association table that connects standard segments and elementary segments'''

    __tablename__ = f'{prefix}StandardSegmentElement'
    standardSegment_id = Column(Text, ForeignKey(
        f'{prefix}StandardSegment._id'), primary_key=True)
    elementarySegment_id = Column(Text, ForeignKey(
        f'{prefix}ElementarySegment._id'), primary_key=True)

    # References
    elementarySegment = relationship('ElementarySegment')
    standardSegment = relationship(
        'StandardSegment', back_populates='elementarySegment')


class StandardSegment(Base):
    ''' Standard segments for LACCategorie. They consist of Elementary segments'''

    __tablename__ = f'{prefix}StandardSegment'
    _id = Column(Text, primary_key=True)
    majorTypeLEC_id = Column(Text, ForeignKey(f'{prefix}MajorTypeLEC._id'))
    detail_id = Column(Text, ForeignKey(f'{prefix}Detail._id'))

    # References
    elementarySegment = relationship('StandardSegmentElement')
    majorTypeLEC = relationship(
        'MajorTypeLEC', back_populates='standardSegment')


class GadValue(Base):
    __tablename__ = f'{prefix}GadValue'
    elementarySegmentGroupCombination_id = Column(Text, ForeignKey(
        f'{prefix}ElementarySegmentGroupCombination._id'), primary_key=True)
    species_id = Column(Integer, ForeignKey(
        f'{prefix}Species.scientificNameId'), primary_key=True)
    majorType_id = Column(Integer, ForeignKey(f'{prefix}MajorType._id'))
    valueM7Scale_id = Column(Integer, ForeignKey(
        f'{prefix}GadScale.m7Scale'), nullable=True)
    valueM3Scale_id = Column(Integer, ForeignKey(
        f'{prefix}GadScale.m3Scale'), nullable=True)
    valueModifier = Column(Integer, nullable=True)
    # lecCombination_id = Column(Integer, ForeignKey(f'{prefix}LECCombination._id'))

    # References
    # elementarySegment = relationship(
    #     'GadValueElementarySegment', back_populates='gadValue')


class ElementarySegmentGroupCombination(Base):
    __tablename__ = f'{prefix}ElementarySegmentGroupCombination'
    _id = Column(Text, primary_key=True)
    elementarySegmentGroup_id = Column(Text, ForeignKey(
        f'{prefix}ElementarySegmentGroup._id'), primary_key=True)

    # References
    # gadValue = relationship('GadValue', back_populates='elementarySegment')


class GadScale(Base):
    ''' Collection of M7 and M3 scales with constancy'''

    __tablename__ = f'{prefix}GadScale'
    m7Scale = Column(Integer, primary_key=True)
    m3Scale = Column(Integer)
    Constancy = Column(Text)


class Species(Base):
    __tablename__ = f'{prefix}Species'
    scientificNameId = Column(Integer, primary_key=True)
    scientificName = Column(Text)
    author = Column(Text)
    vernacularName = Column(Text)
