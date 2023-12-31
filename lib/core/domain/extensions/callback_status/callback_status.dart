enum CallbackStatus {
  initial,
  success,
  error,
  phoneError,
  loading,
  isAdded,
  isRemoved,
  loaded,
  isVerified,
  isLoggedOut,
  isLoggedIn,
  paginationInitiate,
  paginationInProgress,
  paginationEnd,
  changeCameraOnly,
}

extension CallbackStatusX on CallbackStatus {
  bool get isInitial => this == CallbackStatus.initial;
  bool get isSuccess => this == CallbackStatus.success;
  bool get isError => this == CallbackStatus.error;
  bool get isPhoneError => this == CallbackStatus.phoneError;
  bool get isLoading => this == CallbackStatus.loading;
  bool get isLoaded => this == CallbackStatus.loaded;
  bool get isVerified => this == CallbackStatus.isVerified;
  bool get isLoggedIn => this == CallbackStatus.isLoggedIn;
  bool get isLoggedOut => this == CallbackStatus.isLoggedOut;
  bool get isPaginationStart => this == CallbackStatus.paginationInitiate;
  bool get isPaginationInProgress => this == CallbackStatus.paginationInProgress;
  bool get isPaginationEnd => this == CallbackStatus.paginationEnd;
  bool get isChangeCameraOnly => this == CallbackStatus.changeCameraOnly;
}

enum CampaignListApiCallStatus {
  initial,
  inProgress,
  success,
  error,
}

extension CampaignListApiCallStatusX on CampaignListApiCallStatus {
  bool get isInitial => this == CampaignListApiCallStatus.initial;
  bool get isInProgress => this == CampaignListApiCallStatus.inProgress;
  bool get isSuccess => this == CampaignListApiCallStatus.success;
  bool get isError => this == CampaignListApiCallStatus.error;
}

enum GoingStatus {
  initial,
  success,
  error,
}

extension GoingStatusX on GoingStatus {
  bool get isInitial => this == GoingStatus.initial;
  bool get isSuccess => this == GoingStatus.success;
  bool get isError => this == GoingStatus.error;
}
