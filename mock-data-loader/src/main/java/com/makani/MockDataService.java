package com.makani;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.makani.employee.interfaceadapters.EmployeeRepository;
import com.makani.exceptions.SerializationFailureException;
import com.makani.people.employee.EmployeeDataModel;
import com.makani.security.user.InternalAuthDataModel;
import com.makani.utilities.security.AESGCMEncryptionService;
import com.makani.utilities.security.HashingService;
import org.springframework.core.io.ResourceLoader;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.nio.charset.StandardCharsets;
import java.util.List;

@Service
public class MockDataService {

    private final EmployeeRepository employeeRepository;
    private final ResourceLoader resourceLoader;

    private final AESGCMEncryptionService encryptionService;
    private final HashingService hashingService;
    private final PasswordEncoder passwordEncoder;
    private final ObjectMapper objectMapper;

    public MockDataService(EmployeeRepository employeeRepository,
                           ResourceLoader resourceLoader,
                           AESGCMEncryptionService encryptionService,
                           HashingService hashingService,
                           PasswordEncoder passwordEncoder) {
        this.employeeRepository = employeeRepository;
        this.resourceLoader = resourceLoader;
        this.encryptionService = encryptionService;
        this.hashingService = hashingService;
        this.passwordEncoder = passwordEncoder;
        this.objectMapper = new ObjectMapper();
    }

    @Transactional
    public void createAllMockData() throws Exception {
        employeeRepository.deleteAll();

        String jsonContent = new String(resourceLoader.getResource("classpath:mock-data/people/employee.json")
                                                    .getInputStream().readAllBytes(), StandardCharsets.UTF_8);
        List<EmployeeDataModel> employees = objectMapper.readValue(jsonContent, new TypeReference<List<EmployeeDataModel>>() {});

        for (EmployeeDataModel employee : employees) {
            processAndSaveEmployee(employee);
        }

        employeeRepository.saveAll(employees);
    }

    private void processAndSaveEmployee(EmployeeDataModel employee) {
        InternalAuthDataModel internalAuth = employee.getInternalAuth();
        PersonPIIDataModel personPii = employee.getPersonPII();

        if (personPii != null) {
            String originalFirstName = personPii.getFirstName();
            personPii.setFirstName(encryptionService.encrypt(originalFirstName.getBytes(StandardCharsets.UTF_8)));

            String originalLastName = personPii.getLastName();
            personPii.setLastName(encryptionService.encrypt(originalLastName.getBytes(StandardCharsets.UTF_8)));

            String originalEmail = personPii.getEmail();
            personPii.setEmail(encryptionService.encrypt(originalEmail.getBytes(StandardCharsets.UTF_8)));

            String originalPhone = personPii.getPhone();
            personPii.setPhone(encryptionService.encrypt(originalPhone.getBytes(StandardCharsets.UTF_8)));

            String originalAddress = personPii.getAddress();
            personPii.setAddress(encryptionService.encrypt(originalAddress.getBytes(StandardCharsets.UTF_8)));

            String originalZipCode = personPii.getZipCode();
            personPii.setZipCode(encryptionService.encrypt(originalZipCode.getBytes(StandardCharsets.UTF_8)));

            personPii.setEmailHash(hashingService.generateHash(originalEmail));
            personPii.setPhoneHash(hashingService.generateHash(originalPhone));
        } else {
            throw new SerializationFailureException("Fail to serialize Entity: " + PersonPIIDataModel.class.getSimpleName());
        }

        if (internalAuth != null) {
            String originalUsername = internalAuth.getUsername();
            String originalPassword = internalAuth.getPassword();
            String originalRole = internalAuth.getRole();

            internalAuth.setUsername(encryptionService.encrypt(originalUsername.getBytes(StandardCharsets.UTF_8)));
            internalAuth.setPassword(passwordEncoder.encode(originalPassword));
            internalAuth.setRole(encryptionService.encrypt(originalRole.getBytes(StandardCharsets.UTF_8)));
        } else {
            throw new SerializationFailureException("Fail to serialize Entity: " + InternalAuthDataModel.class.getSimpleName());
        }
    }
}
