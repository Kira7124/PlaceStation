package com.project3.placestation.Placeinterface;

import com.project3.placestation.utils.memberValidationGroups;
import jakarta.validation.GroupSequence;

@GroupSequence({memberValidationGroups.NotBlank.class, memberValidationGroups.Pattern.class, memberValidationGroups.Size.class})
public interface ValidationSequence {
}
