
import Foundation
import Swinject

public final class AuthModulesAssembly: Assembly {
    public func assemble(container: Swinject.Container) {
        
        container.autoregister(
            LoginViewModelInput.self,
            initializer: LoginViewModel.init)
        
        container.autoregister(
            RegistrationOneViewModelInput.self,
            initializer: RegistrationOneViewModel.init)
        
        container.autoregister(
            RegistrationTwoViewModelInput.self,
            initializer: RegistrationTwoViewModel.init)
        
        container.autoregister(
            TeacherProfileViewModelInput.self,
            initializer: TeacherProfileViewModel.init)
        
        container.autoregister(
            UpdateTeacherInfoViewModelInput.self,
            initializer: UpdateTeacherInfoViewModel.init)
        
        container.autoregister(
            InformationViewModelInput.self,
            initializer: InformationViewModel.init)
        
        container.autoregister(
            AboutAppViewModelInput.self,
            initializer: AboutAppViewModel.init)
        
        container.autoregister(
            ScheduleViewModelInput.self,
            initializer: ScheduleViewModel.init)
        
        container.autoregister(
            ReviewsViewModelInput.self,
            initializer: ReviewsViewModel.init)
        
        container.autoregister(
            PersonalAdsViewModelInput.self,
            initializer: PersonalAdsViewModel.init)
        
        container.autoregister(
            LessonsListViewModelInput.self,
            initializer: LessonsListViewModel.init)
        
        container.autoregister(
            RecordedVideosViewModelInput.self,
            initializer: RecordedVideosViewModel.init)
    
    }
    
    
}
