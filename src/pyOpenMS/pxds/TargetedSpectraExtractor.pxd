from TransitionTSVFile cimport *
from TargetedExperiment cimport *
from DataValue cimport *
from DefaultParamHandler cimport *
from MSExperiment cimport *
from FeatureMap cimport *
from String cimport *
from Types cimport *

cdef extern from "<OpenMS/ANALYSIS/OPENSWATH/TargetedSpectraExtractor.h>" namespace "OpenMS":

    cdef cppclass TargetedSpectraExtractor(DefaultParamHandler):
        # wrap-inherits:
        #  DefaultParamHandler

        TargetedSpectraExtractor() nogil except +
        TargetedSpectraExtractor(TargetedSpectraExtractor) nogil except +

        void getDefaultParameters(Param&) nogil except +

        void annotateSpectra(libcpp_vector[ MSSpectrum ]&, TargetedExperiment&, libcpp_vector[ MSSpectrum ]&, FeatureMap&) nogil except +
        void annotateSpectra(libcpp_vector[ MSSpectrum ]&, TargetedExperiment&, libcpp_vector[ MSSpectrum ]&) nogil except +

        void pickSpectrum(MSSpectrum&, MSSpectrum&) nogil except +

        void scoreSpectra(libcpp_vector[ MSSpectrum ]&, libcpp_vector[ MSSpectrum ]&, FeatureMap&, libcpp_vector[ MSSpectrum ]&) nogil except +
        void scoreSpectra(libcpp_vector[ MSSpectrum ]&, libcpp_vector[ MSSpectrum ]&, libcpp_vector[ MSSpectrum ]&) nogil except +

        void selectSpectra(libcpp_vector[ MSSpectrum ]&, FeatureMap&, libcpp_vector[ MSSpectrum ]&, FeatureMap&) nogil except +
        void selectSpectra(libcpp_vector[ MSSpectrum ]&, libcpp_vector[ MSSpectrum ]&) nogil except +

        void extractSpectra(MSExperiment&, TargetedExperiment&, libcpp_vector[ MSSpectrum ]&, FeatureMap&) nogil except +
        void extractSpectra(MSExperiment&, TargetedExperiment&, libcpp_vector[ MSSpectrum ]&) nogil except +

        void matchSpectrum(MSSpectrum& input_spectrum, MSExperiment& library, TSE_BinnedSpectrumComparator& cmp, libcpp_vector[ TSE_Match ]& matches) nogil except +


cdef extern from "<OpenMS/ANALYSIS/OPENSWATH/TargetedSpectraExtractor.h>" namespace "OpenMS::TargetedSpectraExtractor":

    cdef cppclass TSE_Match "OpenMS::TargetedSpectraExtractor::Match":

        TSE_Match() nogil except +
        TSE_Match(TSE_Match) nogil except +
        TSE_Match(MSSpectrum& spectrum, double score) nogil except +

        MSSpectrum spectrum
        double score

    cdef cppclass TSE_BinnedSpectrumComparator "OpenMS::TargetedSpectraExtractor::BinnedSpectrumComparator":

        TSE_BinnedSpectrumComparator() nogil except +
        TSE_BinnedSpectrumComparator(TSE_BinnedSpectrumComparator) nogil except +

        void generateScores(MSSpectrum& spec, libcpp_vector[libcpp_cpp[Size,double]]& scores, double min_score) nogil except +
        void init(libcpp_vector[MSSpectrum]& library, libcpp_map[String,DataValue]& options) nogil except +
