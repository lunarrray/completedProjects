
import Foundation
import Swinject

public final class ModulesAssembly: Assembly {
    public func assemble(container: Swinject.Container) {
        container.assemble(assembly: AuthModulesAssembly())
    }
    
    
}
