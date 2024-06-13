include "proto/base.thrift"
include "proto/domain.thrift"

namespace java com.empayre.validator.personal.data
namespace erlang validator_personal_data.validator_personal_data

typedef string PersonalDataToken
typedef string ValidationId

exception PersonalDataTokenNotFound {}

enum ValidationStatus {
    valid
    invalid
}

struct ValidationResponse {
    1: required ValidationId validation_id
    2: required PersonalDataToken token
    3: required ValidationStatus validation_status
}

service ValidatorPersonalDataService {

    ValidationResponse ValidatePersonalData (1: PersonalDataToken token)
        throws (1: PersonalDataTokenNotFound ex1, 2: base.InvalidRequest ex2)
}
