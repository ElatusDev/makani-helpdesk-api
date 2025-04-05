package com.makani.membership.interfaceadapters;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MembershipRepository extends JpaRepository<MembershipDataModel, Long> {
}
