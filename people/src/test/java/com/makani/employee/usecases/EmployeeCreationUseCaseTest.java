package com.makani.employee.usecases;

import com.makani.PersonPIIDataModel;
import com.makani.employee.interfaceadapters.EmployeeRepository;
import com.makani.people.employee.EmployeeDataModel;
import com.makani.utilities.exceptions.ErrorNormalizationException;
import com.makani.utilities.interfaceadapters.HashingService;
import com.makani.utilities.interfaceadapters.PiiNormalizer;
import openapi.makani.domain.people.dto.EmployeeCreationRequestDTO;
import openapi.makani.domain.people.dto.EmployeeCreationResponseDTO;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.modelmapper.ModelMapper;

import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class EmployeeCreationUseCaseTest {

    @Mock
    private EmployeeRepository employeeRepositoryMock;
    @Mock
    private ModelMapper modelMapperMock;
    @Mock
    private HashingService hashingServiceMock;
    @Mock
    private PiiNormalizer piiNormalizerMock;

    @InjectMocks
    private EmployeeCreationUseCase target;

    @Test
    void givenDTOisNull_WhenRunningCreate_ThenThrowException() {
        EmployeeCreationRequestDTO givenDTO = null;
        IllegalArgumentException expectedEx = new IllegalArgumentException("source cannot be null");
        when(modelMapperMock.map(givenDTO, PersonPIIDataModel.class)).thenThrow(expectedEx);

        Assertions.assertThrows(IllegalArgumentException.class,
                () -> target.create(givenDTO));
    }

    @Test
    void givenDTOHasInvalidEmail_WhenRunningCreate_ThenThrowException() {
        String expectedErrMsg = "email cannot be null";
        String expectedEmail = "email invalid";
        ErrorNormalizationException expectedCause = new ErrorNormalizationException(expectedErrMsg);

        EmployeeCreationRequestDTO givenDTO = mock(EmployeeCreationRequestDTO.class);
        PersonPIIDataModel personPIIDataModelMock = mock(PersonPIIDataModel.class);
        EmployeeDataModel employeeDataModelMock = mock(EmployeeDataModel.class);

        when(modelMapperMock.map(givenDTO, PersonPIIDataModel.class)).thenReturn(personPIIDataModelMock);
        when(modelMapperMock.map(givenDTO, EmployeeDataModel.class, EmployeeCreationUseCase.MAP_NAME)).thenReturn(employeeDataModelMock);
        when(employeeDataModelMock.getPersonPII()).thenReturn(personPIIDataModelMock);
        when(personPIIDataModelMock.getEmail()).thenReturn(expectedEmail);

        // point of failure
        when(piiNormalizerMock.normalizeEmail(expectedEmail)).thenThrow(expectedCause);

        ErrorNormalizationException thrown = Assertions.assertThrows(ErrorNormalizationException.class,
                () -> target.create(givenDTO));
        Assertions.assertEquals(expectedErrMsg, thrown.getMessage());
    }

    @Test
    void givenDTOHasInvalidPhone_WhenRunningCreate_ThenThrowException() {
        String expectedErrMsg = "phone number is empty ";
        String expectedEmail = "email@valid";
        String expectedPhone = "invalid phone";
        ErrorNormalizationException expectedCause = new ErrorNormalizationException(expectedErrMsg);

        EmployeeCreationRequestDTO givenDTO = mock(EmployeeCreationRequestDTO.class);
        PersonPIIDataModel personPIIDataModelMock = mock(PersonPIIDataModel.class);
        EmployeeDataModel employeeDataModelMock = mock(EmployeeDataModel.class);


        when(modelMapperMock.map(givenDTO, PersonPIIDataModel.class)).thenReturn(personPIIDataModelMock);
        when(modelMapperMock.map(givenDTO, EmployeeDataModel.class, EmployeeCreationUseCase.MAP_NAME)).thenReturn(employeeDataModelMock);
        when(personPIIDataModelMock.getEmail()).thenReturn(expectedEmail);
        when(employeeDataModelMock.getPersonPII()).thenReturn(personPIIDataModelMock);
        when(piiNormalizerMock.normalizeEmail(expectedEmail)).thenReturn(expectedEmail);
        when(hashingServiceMock.generateHash(expectedEmail)).thenReturn(expectedEmail);
        when(personPIIDataModelMock.getPhone()).thenReturn(expectedPhone);

        //point of failure
        when(piiNormalizerMock.normalizePhoneNumber(expectedPhone)).thenThrow(expectedCause);

        ErrorNormalizationException thrown = Assertions.assertThrows(ErrorNormalizationException.class,
                () -> target.create(givenDTO));
        Assertions.assertEquals(expectedErrMsg, thrown.getMessage());
    }

    @Test
    void givenDTOIsValid_WhenRunningCreate_ThenReturnInstance() {
        String expectedEmail = "email@valid";
        String expectedPhone = "invalid phone";

        EmployeeCreationRequestDTO givenDTO = mock(EmployeeCreationRequestDTO.class);
        PersonPIIDataModel personPIIDataModelMock = mock(PersonPIIDataModel.class);
        EmployeeDataModel employeeDataModelMock = mock(EmployeeDataModel.class);
        EmployeeCreationResponseDTO expectedResult = mock(EmployeeCreationResponseDTO.class);

        when(modelMapperMock.map(givenDTO, PersonPIIDataModel.class)).thenReturn(personPIIDataModelMock);
        when(modelMapperMock.map(givenDTO, EmployeeDataModel.class, EmployeeCreationUseCase.MAP_NAME)).thenReturn(employeeDataModelMock);
        when(personPIIDataModelMock.getEmail()).thenReturn(expectedEmail);
        when(employeeDataModelMock.getPersonPII()).thenReturn(personPIIDataModelMock);
        when(piiNormalizerMock.normalizeEmail(expectedEmail)).thenReturn(expectedEmail);
        when(hashingServiceMock.generateHash(expectedEmail)).thenReturn(expectedEmail);
        when(personPIIDataModelMock.getPhone()).thenReturn(expectedPhone);
        when(piiNormalizerMock.normalizePhoneNumber(expectedPhone)).thenReturn(expectedPhone);
        when(employeeRepositoryMock.save(employeeDataModelMock)).thenReturn(employeeDataModelMock);
        when(modelMapperMock.map(employeeDataModelMock, EmployeeCreationResponseDTO.class)).thenReturn(expectedResult);

        EmployeeCreationResponseDTO result = target.create(givenDTO);
        Assertions.assertEquals(expectedResult, result);
    }
}
